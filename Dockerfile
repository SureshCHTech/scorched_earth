# Use the official JRuby image
FROM jruby:9.1.5.0

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies using Bundler
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 (or any other port your Rails app is using)
EXPOSE 3000

# Set the default command to run when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
