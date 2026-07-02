# SQS Queue
resource "aws_sqs_queue" "queue" {
  name = "app-queue"
}