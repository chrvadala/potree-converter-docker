# Potree Converter docker

Potree Converter utility packed as Docker Container

[![chrvadala](https://img.shields.io/badge/website-chrvadala-orange.svg)](https://chrvadala.github.io)
[![Donate](https://img.shields.io/badge/donate-PayPal-green.svg)](https://www.paypal.me/chrvadala/25)

## Instructions
- Build the image (only first time) 
  ```sh
    docker build -t potreeconverter .
  ```
- Copy a LAS file into `/input`
- Personalize the following command and start the conversion 
  ```sh
    docker run -v $PWD/input:/input -v $PWD/output:/output potreeconverter PotreeConverter /input/perugia.las -p perugia -o /output/perugia
  ```

## Contributors
- [chrvadala](https://github.com/chrvadala) (author)
- [wjjmjh](https://github.com/wjjmjh)

## Credits
Project inspired by https://github.com/sverhoeven/PotreeConverter