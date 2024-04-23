
¢<root"_tf_keras_layer*‚<{
  "name": "CNN",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Functional",
  "config": {
    "name": "CNN",
    "layers": [
      {
        "name": "input_1",
        "class_name": "InputLayer",
        "config": {
          "sparse": false,
          "ragged": false,
          "name": "input_1",
          "dtype": "float32",
          "batch_input_shape": {
            "class_name": "TensorShape",
            "items": [
              null,
              32,
              32,
              3
            ]
          }
        },
        "inbound_nodes": []
      },
      {
        "name": "conv2d",
        "class_name": "Conv2D",
        "config": {
          "filters": 16,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              5,
              5
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "valid",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "input_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "max_pooling2d",
        "class_name": "MaxPooling2D",
        "config": {
          "pool_size": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "padding": "valid",
          "data_format": "channels_last",
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d",
            0,
            0
          ]
        ]
      },
      {
        "name": "conv2d_1",
        "class_name": "Conv2D",
        "config": {
          "filters": 64,
          "kernel_size": {
            "class_name": "__tuple__",
            "items": [
              5,
              5
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "padding": "valid",
          "data_format": "channels_last",
          "dilation_rate": {
            "class_name": "__tuple__",
            "items": [
              1,
              1
            ]
          },
          "groups": 1,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "max_pooling2d",
            0,
            0
          ]
        ]
      },
      {
        "name": "max_pooling2d_1",
        "class_name": "MaxPooling2D",
        "config": {
          "pool_size": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "strides": {
            "class_name": "__tuple__",
            "items": [
              2,
              2
            ]
          },
          "padding": "valid",
          "data_format": "channels_last",
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "conv2d_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "flatten",
        "class_name": "Flatten",
        "config": {
          "data_format": "channels_last",
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "max_pooling2d_1",
            0,
            0
          ]
        ]
      },
      {
        "name": "dense",
        "class_name": "Dense",
        "config": {
          "units": 128,
          "activation": "relu",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "flatten",
            0,
            0
          ]
        ]
      },
      {
        "name": "dropout",
        "class_name": "Dropout",
        "config": {
          "rate": 0.2,
          "noise_shape": null,
          "seed": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dense",
            0,
            0
          ]
        ]
      },
      {
        "name": "dense_1",
        "class_name": "Dense",
        "config": {
          "units": 10,
          "activation": "softmax",
          "use_bias": true,
          "kernel_initializer": {
            "class_name": "GlorotUniform",
            "config": {
              "seed": null
            }
          },
          "bias_initializer": {
            "class_name": "Zeros",
            "config": {}
          },
          "kernel_regularizer": null,
          "bias_regularizer": null,
          "kernel_constraint": null,
          "bias_constraint": null,
          "name": null,
          "dtype": "float32",
          "trainable": true
        },
        "inbound_nodes": [
          [
            "dropout",
            0,
            0
          ]
        ]
      }
    ],
    "input_layers": [
      [
        "input_1",
        0,
        0
      ]
    ],
    "output_layers": [
      [
        "dense_1",
        0,
        0
      ]
    ]
  },
  "shared_object_id": 1,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      32,
      32,
      3
    ]
  }
}2
èroot.layer-0"_tf_keras_input_layer*¸{"class_name":"InputLayer","name":"input_1","dtype":"float32","sparse":false,"ragged":false,"batch_input_shape":{"class_name":"TensorShape","items":[null,32,32,3]},"config":{"sparse":false,"ragged":false,"name":"input_1","dtype":"float32","batch_input_shape":{"class_name":"TensorShape","items":[null,32,32,3]}}}2
¤root.layer_with_weights-0"_tf_keras_layer*í{
  "name": "conv2d",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 3
      }
    },
    "shared_object_id": 2
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 16,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        5,
        5
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "valid",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 3,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      32,
      32,
      3
    ]
  }
}2
root.layer-2"_tf_keras_layer*×{
  "name": "max_pooling2d",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "MaxPooling2D",
  "config": {
    "pool_size": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "padding": "valid",
    "data_format": "channels_last",
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 4,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      28,
      28,
      16
    ]
  }
}2
¨root.layer_with_weights-1"_tf_keras_layer*ñ{
  "name": "conv2d_1",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 4,
      "MaxNdim": null,
      "Axes": {
        "-1": 16
      }
    },
    "shared_object_id": 5
  },
  "class_name": "Conv2D",
  "config": {
    "filters": 64,
    "kernel_size": {
      "class_name": "__tuple__",
      "items": [
        5,
        5
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "padding": "valid",
    "data_format": "channels_last",
    "dilation_rate": {
      "class_name": "__tuple__",
      "items": [
        1,
        1
      ]
    },
    "groups": 1,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 6,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      14,
      14,
      16
    ]
  }
}2
ƒroot.layer-4"_tf_keras_layer*Ù{
  "name": "max_pooling2d_1",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "MaxPooling2D",
  "config": {
    "pool_size": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "strides": {
      "class_name": "__tuple__",
      "items": [
        2,
        2
      ]
    },
    "padding": "valid",
    "data_format": "channels_last",
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 7,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      10,
      10,
      64
    ]
  }
}2
ýroot.layer-5"_tf_keras_layer*Ó{
  "name": "flatten",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Flatten",
  "config": {
    "data_format": "channels_last",
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 8,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      5,
      5,
      64
    ]
  }
}2
îroot.layer_with_weights-2"_tf_keras_layer*·{
  "name": "dense",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 2,
      "MaxNdim": null,
      "Axes": {
        "-1": 1600
      }
    },
    "shared_object_id": 9
  },
  "class_name": "Dense",
  "config": {
    "units": 128,
    "activation": "relu",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 10,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      1600
    ]
  }
}2
…root.layer-7"_tf_keras_layer*Û{
  "name": "dropout",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "class_name": "Dropout",
  "config": {
    "rate": 0.2,
    "noise_shape": null,
    "seed": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 11,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      128
    ]
  }
}2
ñ	root.layer_with_weights-3"_tf_keras_layer*º{
  "name": "dense_1",
  "trainable": true,
  "expects_training_arg": false,
  "dtype": "float32",
  "batch_input_shape": null,
  "autocast": false,
  "input_spec": {
    "class_name": "InputSpec",
    "config": {
      "DType": null,
      "Shape": null,
      "Ndim": null,
      "MinNdim": 2,
      "MaxNdim": null,
      "Axes": {
        "-1": 128
      }
    },
    "shared_object_id": 12
  },
  "class_name": "Dense",
  "config": {
    "units": 10,
    "activation": "softmax",
    "use_bias": true,
    "kernel_initializer": {
      "class_name": "GlorotUniform",
      "config": {
        "seed": null
      }
    },
    "bias_initializer": {
      "class_name": "Zeros",
      "config": {}
    },
    "kernel_regularizer": null,
    "bias_regularizer": null,
    "kernel_constraint": null,
    "bias_constraint": null,
    "name": null,
    "dtype": "float32",
    "trainable": true
  },
  "shared_object_id": 13,
  "build_input_shape": {
    "class_name": "TensorShape",
    "items": [
      null,
      128
    ]
  }
}2