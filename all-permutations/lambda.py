import json
import itertools

def lambda_handler(event, context):
    body = json.loads(event['body'])
    all_permutations = []

    for x in permutate(body['letters']):
        all_permutations.append(''.join(x))

    return {"statusCode": 200, "body": json.dumps(all_permutations)}

def permutate(l):
    yield from itertools.product(*([l] * len(l))) 