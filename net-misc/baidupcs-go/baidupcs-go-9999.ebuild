# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="BaiduPCS-Go"

inherit go-module

DESCRIPTION="The terminal utility for Baidu Network Disk (Golang Version)."
HOMEPAGE="https://github.com/qjfoidnh/BaiduPCS-Go"
LICENSE="Apache-2.0"
SLOT="0"

EGIT_REPO_URI="${HOMEPAGE}.git"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3

	src_unpack() {
		git-r3_src_unpack
		go-module_live_vendor
	}
else
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"

	EGO_SUM=(
		"github.com/BurntSushi/toml v0.3.1/go.mod"
		"github.com/GeertJohan/go.incremental v1.0.0"
		"github.com/GeertJohan/go.incremental v1.0.0/go.mod"
		"github.com/GeertJohan/go.rice v0.0.0-20170420135705-c02ca9a983da/go.mod"
		"github.com/GeertJohan/go.rice v1.0.2"
		"github.com/GeertJohan/go.rice v1.0.2/go.mod"
		"github.com/Knetic/govaluate v3.0.0+incompatible/go.mod"
		"github.com/akavel/rsrc v0.8.0/go.mod"
		"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
		"github.com/alecthomas/template v0.0.0-20190718012654-fb15b899a751/go.mod"
		"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
		"github.com/alecthomas/units v0.0.0-20190717042225-c3de453c63f4/go.mod"
		"github.com/alicebob/gopher-json v0.0.0-20180125190556-5a6b3ba71ee6/go.mod"
		"github.com/alicebob/miniredis v2.5.0+incompatible/go.mod"
		"github.com/astaxie/beego v1.10.1/go.mod"
		"github.com/astaxie/beego v1.12.3"
		"github.com/astaxie/beego v1.12.3/go.mod"
		"github.com/beego/goyaml2 v0.0.0-20130207012346-5545475820dd/go.mod"
		"github.com/beego/x2j v0.0.0-20131220205130-a0352aadc542/go.mod"
		"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
		"github.com/beorn7/perks v1.0.0/go.mod"
		"github.com/beorn7/perks v1.0.1/go.mod"
		"github.com/bitly/go-simplejson v0.5.0"
		"github.com/bitly/go-simplejson v0.5.0/go.mod"
		"github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869"
		"github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869/go.mod"
		"github.com/bradfitz/gomemcache v0.0.0-20180710155616-bc664df96737/go.mod"
		"github.com/casbin/casbin v1.7.0/go.mod"
		"github.com/cespare/xxhash/v2 v2.1.1/go.mod"
		"github.com/cloudflare/golz4 v0.0.0-20150217214814-ef862a3cdc58/go.mod"
		"github.com/couchbase/go-couchbase v0.0.0-20200519150804-63f3cdb75e0d/go.mod"
		"github.com/couchbase/gomemcached v0.0.0-20200526233749-ec430f949808/go.mod"
		"github.com/couchbase/goutils v0.0.0-20180530154633-e865a1461c8a/go.mod"
		"github.com/cpuguy83/go-md2man v1.0.10"
		"github.com/cpuguy83/go-md2man v1.0.10/go.mod"
		"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d"
		"github.com/cpuguy83/go-md2man/v2 v2.0.0-20190314233015-f79a8a8ca69d/go.mod"
		"github.com/cupcake/rdb v0.0.0-20161107195141-43ba34106c76/go.mod"
		"github.com/daaku/go.zipexe v0.0.0-20150329023125-a5fe2436ffcb/go.mod"
		"github.com/daaku/go.zipexe v1.0.0"
		"github.com/daaku/go.zipexe v1.0.0/go.mod"
		"github.com/davecgh/go-spew v1.1.0/go.mod"
		"github.com/davecgh/go-spew v1.1.1"
		"github.com/davecgh/go-spew v1.1.1/go.mod"
		"github.com/dgrijalva/jwt-go v3.2.0+incompatible"
		"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
		"github.com/edsrzf/mmap-go v0.0.0-20170320065105-0bce6a688712/go.mod"
		"github.com/elastic/go-elasticsearch/v6 v6.8.5/go.mod"
		"github.com/elazarl/go-bindata-assetfs v1.0.0/go.mod"
		"github.com/fatih/color v0.0.0-20150510220652-1b35f289c47d/go.mod"
		"github.com/fatih/color v1.10.0"
		"github.com/fatih/color v1.10.0/go.mod"
		"github.com/fsnotify/fsnotify v1.4.7/go.mod"
		"github.com/glendc/gopher-json v0.0.0-20170414221815-dc4743023d0c/go.mod"
		"github.com/go-kit/kit v0.8.0/go.mod"
		"github.com/go-kit/kit v0.9.0/go.mod"
		"github.com/go-logfmt/logfmt v0.3.0/go.mod"
		"github.com/go-logfmt/logfmt v0.4.0/go.mod"
		"github.com/go-redis/redis v6.14.2+incompatible/go.mod"
		"github.com/go-sql-driver/mysql v1.5.0/go.mod"
		"github.com/go-stack/stack v1.8.0/go.mod"
		"github.com/gogo/protobuf v1.1.1/go.mod"
		"github.com/golang/protobuf v1.2.0/go.mod"
		"github.com/golang/protobuf v1.3.1/go.mod"
		"github.com/golang/protobuf v1.3.2/go.mod"
		"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
		"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
		"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
		"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
		"github.com/golang/protobuf v1.4.0/go.mod"
		"github.com/golang/protobuf v1.4.2/go.mod"
		"github.com/golang/protobuf v1.4.3"
		"github.com/golang/protobuf v1.4.3/go.mod"
		"github.com/golang/snappy v0.0.0-20170215233205-553a64147049/go.mod"
		"github.com/golang/snappy v0.0.0-20180518054509-2e65f85255db/go.mod"
		"github.com/gomodule/redigo v2.0.0+incompatible/go.mod"
		"github.com/google/go-cmp v0.3.0/go.mod"
		"github.com/google/go-cmp v0.3.1/go.mod"
		"github.com/google/go-cmp v0.4.0"
		"github.com/google/go-cmp v0.4.0/go.mod"
		"github.com/google/gofuzz v1.0.0/go.mod"
		"github.com/hashicorp/golang-lru v0.5.4/go.mod"
		"github.com/hpcloud/tail v1.0.0/go.mod"
		"github.com/iikira/Baidu-Login v1.2.2-0.20180427090606-ecf146973528/go.mod"
		"github.com/iikira/baidu-tools v0.0.0-20190609113215-4dd64618064d/go.mod"
		"github.com/jessevdk/go-flags v1.4.0/go.mod"
		"github.com/json-iterator/go v1.1.6/go.mod"
		"github.com/json-iterator/go v1.1.7/go.mod"
		"github.com/json-iterator/go v1.1.10"
		"github.com/json-iterator/go v1.1.10/go.mod"
		"github.com/julienschmidt/httprouter v1.2.0/go.mod"
		"github.com/kardianos/osext v0.0.0-20170510131534-ae77be60afb1/go.mod"
		"github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0"
		"github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0/go.mod"
		"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
		"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
		"github.com/kr/pretty v0.1.0"
		"github.com/kr/pretty v0.1.0/go.mod"
		"github.com/kr/pty v1.1.1/go.mod"
		"github.com/kr/text v0.1.0"
		"github.com/kr/text v0.1.0/go.mod"
		"github.com/ledisdb/ledisdb v0.0.0-20200510135210-d35789ec47e6/go.mod"
		"github.com/lib/pq v1.0.0/go.mod"
		"github.com/mattn/go-colorable v0.1.8"
		"github.com/mattn/go-colorable v0.1.8/go.mod"
		"github.com/mattn/go-isatty v0.0.12"
		"github.com/mattn/go-isatty v0.0.12/go.mod"
		"github.com/mattn/go-runewidth v0.0.3/go.mod"
		"github.com/mattn/go-runewidth v0.0.4/go.mod"
		"github.com/mattn/go-runewidth v0.0.5-0.20181218000649-703b5e6b11ae/go.mod"
		"github.com/mattn/go-runewidth v0.0.7/go.mod"
		"github.com/mattn/go-runewidth v0.0.9"
		"github.com/mattn/go-runewidth v0.0.9/go.mod"
		"github.com/mattn/go-sqlite3 v2.0.3+incompatible/go.mod"
		"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
		"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
		"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd"
		"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
		"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod"
		"github.com/modern-go/reflect2 v1.0.1"
		"github.com/modern-go/reflect2 v1.0.1/go.mod"
		"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
		"github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e/go.mod"
		"github.com/nkovacs/streamquote v1.0.0/go.mod"
		"github.com/oleiade/lane v0.0.0-20160817071224-3053869314bb/go.mod"
		"github.com/oleiade/lane v1.0.1"
		"github.com/oleiade/lane v1.0.1/go.mod"
		"github.com/olekukonko/tablewriter v0.0.1/go.mod"
		"github.com/olekukonko/tablewriter v0.0.2-0.20190618033246-cc27d85e17ce/go.mod"
		"github.com/olekukonko/tablewriter v0.0.4"
		"github.com/olekukonko/tablewriter v0.0.4/go.mod"
		"github.com/onsi/ginkgo v1.6.0/go.mod"
		"github.com/onsi/ginkgo v1.12.0/go.mod"
		"github.com/onsi/gomega v1.7.1/go.mod"
		"github.com/pelletier/go-toml v1.0.1/go.mod"
		"github.com/pelletier/go-toml v1.2.0/go.mod"
		"github.com/peterh/liner v1.0.1-0.20171122030339-3681c2a91233/go.mod"
		"github.com/peterh/liner v1.1.1-0.20190305032635-6f820f8f90ce/go.mod"
		"github.com/peterh/liner v1.2.1"
		"github.com/peterh/liner v1.2.1/go.mod"
		"github.com/pkg/errors v0.8.0/go.mod"
		"github.com/pkg/errors v0.8.1/go.mod"
		"github.com/pkg/errors v0.9.1/go.mod"
		"github.com/pmezard/go-difflib v1.0.0"
		"github.com/pmezard/go-difflib v1.0.0/go.mod"
		"github.com/prometheus/client_golang v0.9.1/go.mod"
		"github.com/prometheus/client_golang v1.0.0/go.mod"
		"github.com/prometheus/client_golang v1.7.0/go.mod"
		"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
		"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
		"github.com/prometheus/client_model v0.2.0/go.mod"
		"github.com/prometheus/common v0.4.1/go.mod"
		"github.com/prometheus/common v0.10.0/go.mod"
		"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
		"github.com/prometheus/procfs v0.0.2/go.mod"
		"github.com/prometheus/procfs v0.1.3/go.mod"
		"github.com/qjfoidnh/Baidu-Login v1.4.0"
		"github.com/qjfoidnh/Baidu-Login v1.4.0/go.mod"
		"github.com/qjfoidnh/BaiduPCS-Go v0.0.0-20201218134534-d55d9918bd1b/go.mod"
		"github.com/qjfoidnh/baidu-tools v1.2.0"
		"github.com/qjfoidnh/baidu-tools v1.2.0/go.mod"
		"github.com/russross/blackfriday v1.5.2"
		"github.com/russross/blackfriday v1.5.2/go.mod"
		"github.com/russross/blackfriday/v2 v2.0.1"
		"github.com/russross/blackfriday/v2 v2.0.1/go.mod"
		"github.com/shiena/ansicolor v0.0.0-20151119151921-a422bbe96644/go.mod"
		"github.com/shurcooL/httpfs v0.0.0-20190707220628-8d4bc4ba7749/go.mod"
		"github.com/shurcooL/sanitized_anchor_name v1.0.0"
		"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
		"github.com/shurcooL/vfsgen v0.0.0-20181202132449-6a9ea43bcacd/go.mod"
		"github.com/siddontang/go v0.0.0-20170517070808-cb568a3e5cc0/go.mod"
		"github.com/siddontang/goredis v0.0.0-20150324035039-760763f78400/go.mod"
		"github.com/siddontang/rdb v0.0.0-20150307021120-fc89ed2e418d/go.mod"
		"github.com/sirupsen/logrus v1.2.0/go.mod"
		"github.com/sirupsen/logrus v1.4.2/go.mod"
		"github.com/ssdb/gossdb v0.0.0-20180723034631-88f6b59b84ec/go.mod"
		"github.com/stretchr/objx v0.1.0/go.mod"
		"github.com/stretchr/objx v0.1.1/go.mod"
		"github.com/stretchr/testify v1.2.2/go.mod"
		"github.com/stretchr/testify v1.3.0/go.mod"
		"github.com/stretchr/testify v1.4.0"
		"github.com/stretchr/testify v1.4.0/go.mod"
		"github.com/syndtr/goleveldb v0.0.0-20160425020131-cfa635847112/go.mod"
		"github.com/syndtr/goleveldb v0.0.0-20181127023241-353a9fca669c/go.mod"
		"github.com/tidwall/gjson v1.6.0/go.mod"
		"github.com/tidwall/gjson v1.6.4"
		"github.com/tidwall/gjson v1.6.4/go.mod"
		"github.com/tidwall/match v1.0.1"
		"github.com/tidwall/match v1.0.1/go.mod"
		"github.com/tidwall/pretty v1.0.0/go.mod"
		"github.com/tidwall/pretty v1.0.2"
		"github.com/tidwall/pretty v1.0.2/go.mod"
		"github.com/ugorji/go v0.0.0-20171122102828-84cb69a8af83/go.mod"
		"github.com/urfave/cli v1.21.1-0.20190817182405-23c83030263f/go.mod"
		"github.com/urfave/cli v1.22.5"
		"github.com/urfave/cli v1.22.5/go.mod"
		"github.com/valyala/bytebufferpool v1.0.0/go.mod"
		"github.com/valyala/fasttemplate v1.0.1/go.mod"
		"github.com/wendal/errors v0.0.0-20130201093226-f66c77a7882b/go.mod"
		"github.com/yuin/gopher-lua v0.0.0-20171031051903-609c9cd26973/go.mod"
		"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
		"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
		"golang.org/x/crypto v0.0.0-20190820162420-60c769a6c586/go.mod"
		"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550"
		"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
		"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
		"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
		"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
		"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980/go.mod"
		"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
		"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
		"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
		"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
		"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
		"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
		"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
		"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
		"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
		"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
		"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
		"golang.org/x/sys v0.0.0-20191025090151-53bf42e6b339/go.mod"
		"golang.org/x/sys v0.0.0-20191120155948-bd437916bb0e/go.mod"
		"golang.org/x/sys v0.0.0-20200106162015-b016eb3dc98e/go.mod"
		"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
		"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
		"golang.org/x/sys v0.0.0-20200615200032-f1bc736245b1"
		"golang.org/x/sys v0.0.0-20200615200032-f1bc736245b1/go.mod"
		"golang.org/x/text v0.3.0/go.mod"
		"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
		"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
		"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
		"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
		"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
		"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
		"google.golang.org/protobuf v1.21.0/go.mod"
		"google.golang.org/protobuf v1.23.0"
		"google.golang.org/protobuf v1.23.0/go.mod"
		"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
		"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
		"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
		"gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f/go.mod"
		"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
		"gopkg.in/mgo.v2 v2.0.0-20190816093944-a6b53ec6cb22/go.mod"
		"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
		"gopkg.in/yaml.v2 v2.2.1/go.mod"
		"gopkg.in/yaml.v2 v2.2.2/go.mod"
		"gopkg.in/yaml.v2 v2.2.4/go.mod"
		"gopkg.in/yaml.v2 v2.2.5/go.mod"
		"gopkg.in/yaml.v2 v2.2.8"
		"gopkg.in/yaml.v2 v2.2.8/go.mod"
	)
go-module_set_globals

	SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}"

	S="${WORKDIR}/${MY_PN}-${PV}"
fi

DEPEND=""
RDEPEND="${DEPEND}
	!net-misc/baidupcs-go-bin
"

src_compile() {
	export GOFLAGS="-buildmode=pie -trimpath"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	go build -o ${PN} || die
}

src_install() {
	default
	dobin ${PN}
}
