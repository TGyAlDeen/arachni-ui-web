=begin
    Copyright 2010-2012 Tasos Laskos <tasos.laskos@gmail.com>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
=end

class ApplicationController < ActionController::Base
    before_filter :wipe_storage

    protect_from_forgery
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, alert: exception.message
    end

    def self.storage
        @storage ||= {}
    end
    def storage
        self.class.storage
    end

    def wipe_storage
        storage.clear
    end
end
