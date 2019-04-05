# A Docker configuration for sen2cor

## Example
For a brief example, you first need to download a Sentinel 2 level 1C granule in the SAFE format, and place this unzipped in the `data/example` directory.

Next run the Docker process with:
```shell
docker-compose run sen2cor \
    L2A_Process /data/example/S2B_MSIL1C_20190331T000239_N0207_R030_T55GEN_20190331T005814.SAFE \
        --resolution 20
```

If you would like more examples, please raise an issue!


## Notes
* If the run fails with an error like `[CRITICAL]  L2A_Config: 3181   Error in creating L2A User Product` then this may mean your granules don't have the `AUX_DATA` or `HTML` folders. The files I downloaded from CreoDIAS didn't have the `AUX_DATA` folders, so I created them, and it seems to work.