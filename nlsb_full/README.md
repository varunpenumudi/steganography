# Contents of Files

## Main Code
- LSB_CODE.m              - main code for the project

## Embedding Files
- get_difference.m        - get the difference of channel and secret message
- msg_to_bits.m           - convert difference message into bits
- mlea_encrypt.m          - encrypt the bits
- apply_magic.m           - apply magic matrix to a block of code
- shuffle_channel.m       - shuffle the channel by dividing into blocks and applying magic matrix to each block
- embed_to_channel.m      - embed bits into channel
- reverse_magic.m         - reverse the magic matrix
- unshuffle_channel.m     - unshuffle the channel by dividing into blocks and reversing magic matrix to each block

## Extracting Files
- shuffle_channel.m       - shuffle the channel by dividing into blocks and applying magic matrix to each block
- extract_from_channel.m  - extract bits from the channel
- mlea_decrypt.m          - decrypt the bits
- bits_to_msg.m           - converts the extracted bits back to difference
- get_difference.m        - get the difference of channel and extracted message
- random_message.m        - creates a random message of specified size

## Show metrics
- metrics.m               - calculate metrics like PSNR, MSE for cover and stego images
