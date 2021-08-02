// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"
import "stylesheets/application";

Rails.start()
Turbolinks.start()
// ActiveStorage.start()
require("jquery");
require("jquery-ui/ui/widgets/autocomplete");
require("bootstrap");
require("flatpickr");

require("packs/flash");
require("packs/flatpickr");

import {config, library, dom} from '@fortawesome/fontawesome-svg-core'
import {faUser as fasFaUser} from '@fortawesome/free-solid-svg-icons'
import {faTrashAlt as fasFaTrashAlt} from '@fortawesome/free-solid-svg-icons'
import {faSignOutAlt as fasFaSignOutAlt} from '@fortawesome/free-solid-svg-icons'
import {faEye as fasFaEye} from '@fortawesome/free-solid-svg-icons'
import {faPencilAlt as fasFaPencilAlt} from '@fortawesome/free-solid-svg-icons'
import {faPlus as fasFaPlus} from '@fortawesome/free-solid-svg-icons'
import {faChevronRight as fasFaChevronRight} from '@fortawesome/free-solid-svg-icons'
import {faSpinner as fasFaSpinner} from '@fortawesome/free-solid-svg-icons'
import {faUsers as fasFaUsers} from '@fortawesome/free-solid-svg-icons'
import {faCog as fasFaCog} from '@fortawesome/free-solid-svg-icons'

config.mutateApproach = 'sync'
library.add(fasFaUser, fasFaTrashAlt, fasFaPlus, fasFaSignOutAlt, fasFaChevronRight, fasFaEye, fasFaPencilAlt,
    fasFaSpinner, fasFaUsers, fasFaCog)
dom.watch()
