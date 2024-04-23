open System.Collections.Generic
open Plotly.NET
open Plotly.NET.ImageExport
open Tensorflow.NumPy
open Tensorflow
open type Tensorflow.Binding
open type Tensorflow.KerasApi
open type Tensorflow.Keras.Utils.np_utils

let layers = keras.layers

let cnn =
    let input = keras.Input(shape = Shape(32, 32, 3))

    let modelFlow =
        input
        |> layers.Conv2D(16, 5, activation = "relu").Apply
        |> layers.MaxPooling2D(2).Apply
        |> layers.Conv2D(64, 5, activation = "relu").Apply
        |> layers.MaxPooling2D(2).Apply
        |> layers.Flatten().Apply
        |> layers.Dense(128, activation = "relu").Apply
        |> layers.Dropout(0.2f).Apply

    let output = modelFlow |> layers.Dense(10, activation = "softmax").Apply

    keras.Model(input, output, "CNN")


let prepareData () =
    let (x_train, y_train, x_test, y_test) =
        keras.datasets.cifar10.load_data().Deconstruct()

    let x_train = x_train.astype (TF_DataType.TF_FLOAT)
    let x_test = x_test.astype (TF_DataType.TF_FLOAT)

    // normalize
    let x_train = x_train / 255
    let x_test = x_test / 255

    let x_train = x_train.numpy ()
    let x_test = x_test.numpy ()

    // one-hot encoding
    let y_train = to_categorical (y_train, 10)
    let y_test = to_categorical (y_test, 10)

    (x_train, y_train, x_test, y_test)


let showTrainHistory (trainHistory: Dictionary<string, List<float32>>) =
    let train =
        Chart.Line(x = [ 0 .. trainHistory["accuracy"].Count ], y = trainHistory["accuracy"], Name = "train")

    let validation =
        Chart.Line(x = [ 0 .. trainHistory["val_accuracy"].Count ], y = trainHistory["val_accuracy"], Name = "test")

    let chart =
        Chart.combine ([| train; validation |]) |> Chart.withTitle "Train History"

    chart |> Chart.savePNG ("trainHistory")

    chart |> Chart.show


let train (model: Keras.Engine.IModel) (x_train: NDArray, y_train) (x_test, y_test) =
    model.fit (x_train, y_train, batch_size = 32, epochs = 10, validation_split = 0.2f, verbose = 1)
    |> fun callback -> callback.history
    |> showTrainHistory


    model.evaluate (x_test, y_test, verbose = 2)
    |> Seq.iter (fun record -> printfn $"{record.Key} = {record.Value}")

    model.save ("./cnnCifar10")


[<EntryPoint>]
let main argv =
    let (x_train, y_train, x_test, y_test) = prepareData ()
    printfn $"{x_train.GetType()} {x_test.GetType()}"
    printfn "%s" (cnn.GetType().ToString())
    cnn.summary ()

    cnn.compile (
        optimizer = keras.optimizers.Adam(1e-3f),
        loss = keras.losses.CategoricalCrossentropy(),
        metrics = [| "acc" |]
    )

    train cnn (x_train, y_train) (x_test, y_test)

    0
