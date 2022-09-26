James Wallace - DevOps Candidate
sausages@gmail.com

2022-09-26

Scenario - Create and deploy a web service end-to-end

The Challenge

Create an internet-facing web service accepting a number of digits and displaying all possible
combinations back to the user.

Example input: `123` would give as response:

```
123
213
312
132
231
321
```

Guidelines

1. There is no restriction to the resources/documentation you use to accomplish the task.
2. Base the simple web application on a language you are most familiar with to accomplish the above
   challenge.
3. Include a mechanism for deploying the solution to a platform of your choice.
4. The solution must be developed and stored using a source control system -- The codebase will
   need to be made available to us for review ahead of the technical assessment.
5. Be able to outline your design, the steps you took for implementation, and demonstrate the 
   solution is complete and correct during a follow-up hands-on discussion.
6. Confirm that the solution is secured appropriately as a public facing service.
7. The choice of tooling is entirely yours -- there are plenty of services out there that offer
   free “no credit card required” accounts — some examples include (but not limited to): Linode, 
   Digital Ocean, Azure DevOps, GitHub Actions, CircleCI, etc.
8. While it’s up to you as to the amount of time you choose to spend on it, to be fair to you as a 
   candidate, please limit your expected level of investment -- perfection is not an expectation.

=============
Solution:

I put together a quick python function in a lambda that generates the complete set of all input characters.
This is put into a lambda function, with API Gateway in front, on AWS.

To automate publishing and setup, I've used terraform.

One should be able to run 'terraform apply' from this directory to have it setup.
Take the output invoke_url, and add it into the following to test:

curl -X POST -H "Content-Type: application/json" \
	-d '{"letters": "abcdef"}' \
	<INVOKE URL>/serverless_lambda_stage/permutate

With the lambda defaults, 128mb mem, 3sec execution, we hit both timeouts and memory constraints when we go above 6 characters in the input set.
Beyond that, we also exceed maximum output size.   So if sets greater than six characters were routinely going to be accessed, I would account for that
with adjusted limits, and further testing.
