# Image Processing Repository

This repository contains various implementations for image processing tasks using MATLAB.

## Contents

1. **Low-Pass Filtering using FFT, DCT, and DWT**
   - Function: `LP1_4_FDCW(K)`
   - Applies low-pass filters using different frequency domain transforms (FFT, DCT, DWT).
   - Computes and displays filtered images along with PSNR values.

2. **Edge Detection using Gradient Filter**
   - Function: `edge_by_gradient(K, T)`
   - Produces binary edge images using gradient filtering on frequency domain coefficients.
   - Compares results with the Canny edge detection method.

3. **Harris Corner Detection**
   - Function: `H2_harris(k, m)`
   - Implements Harris corner detection and displays corners on the input image.
   - Uses gradient computation and matrix operations for corner detection.

4. **Texture Classification using LBP**
   - Function: `lbp_hist(K, w)`
   - Extracts LBP features from images and classifies textures based on histogram comparisons.
   - Evaluates similarity using Euclidean distance, City block distance, and chessboard distance.

## Getting Started

### Prerequisites

- MATLAB R2020a or later.
- Image Processing Toolbox.

### Installation

Clone this repository to your local machine:

```bash
git clone https://github.com/Parnianjalali/Image-Processing.git
