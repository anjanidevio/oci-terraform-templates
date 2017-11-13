output " splunk_image" {
    value = "${lookup(data.oci_core_images.ImageOCID.images[0], "id")}"
} 