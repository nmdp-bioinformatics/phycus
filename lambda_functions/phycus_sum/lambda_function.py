import phycus
import json
import urllib.parse


def lambda_handler(event, context):
    subid = event['submissionid']
    client = phycus.ApiClient(host="phycus.b12x.org")
    api = phycus.DefaultApi(api_client=client)
    alldata = api.hfc_submission_id_haplotypes_get(submission_id=subid)
    return sum(list(map(lambda h: h.frequency,
                        alldata.haplotype_frequency_list)))

