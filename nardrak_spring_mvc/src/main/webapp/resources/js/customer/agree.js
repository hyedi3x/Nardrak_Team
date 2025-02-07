/**
 * 
 */

// '전체 동의' 체크박스를 클릭하면 모든 체크박스를 체크/해제
function toggleAgreement(checkbox) {
    var collectPersonalInfo = document.getElementById('collectPersonalInfo');
    var usePersonalInfo = document.getElementById('usePersonalInfo');
    var dataRetention = document.getElementById('dataRetention');
    var thirdParty = document.getElementById('thirdParty');
    var privacyProtection = document.getElementById('privacyProtection');
    var userRights = document.getElementById('userRights');
    var marketingConsent = document.getElementById('marketingConsent');

    // '전체 동의' 상태에 맞춰 모든 체크박스를 체크하거나 해제
    collectPersonalInfo.checked = checkbox.checked;
    usePersonalInfo.checked = checkbox.checked;
    dataRetention.checked = checkbox.checked;
    thirdParty.checked = checkbox.checked;
    privacyProtection.checked = checkbox.checked;
    userRights.checked = checkbox.checked;
    marketingConsent.checked = checkbox.checked;  // Optional checkbox still follows the '전체 동의' checkbox
}

// 개별 체크박스를 클릭할 때 전체 동의 체크박스를 업데이트
function updateFinalAgreeCheckbox() {
    var collectPersonalInfo = document.getElementById('collectPersonalInfo');
    var usePersonalInfo = document.getElementById('usePersonalInfo');
    var dataRetention = document.getElementById('dataRetention');
    var thirdParty = document.getElementById('thirdParty');
    var privacyProtection = document.getElementById('privacyProtection');
    var userRights = document.getElementById('userRights');
    
    // 모든 체크박스가 체크되었는지 확인 (marketingConsent 제외)
    if (collectPersonalInfo.checked && usePersonalInfo.checked && dataRetention.checked &&
        thirdParty.checked && privacyProtection.checked && userRights.checked) {
        document.getElementById('finalAgree').checked = true;  // 전체 동의 체크박스 체크
    } else {
        document.getElementById('finalAgree').checked = false; // 전체 동의 체크박스 해제
    }
}

// 폼 제출 시 필수 체크박스가 모두 동의되었는지 확인
function validateForm() {
    var requiredCheckboxes = [
        document.getElementById('collectPersonalInfo'),
        document.getElementById('usePersonalInfo'),
        document.getElementById('dataRetention'),
        document.getElementById('thirdParty'),
        document.getElementById('privacyProtection'),
        document.getElementById('userRights')
    ];

    // 체크되지 않은 첫 번째 체크박스를 찾음
    var firstUnchecked = null;

    for (var i = 0; i < requiredCheckboxes.length; i++) {
        if (!requiredCheckboxes[i].checked) {
            if (!firstUnchecked) {
                firstUnchecked = requiredCheckboxes[i];  // 첫 번째 체크되지 않은 체크박스를 저장
            }
        }
    }

    // 체크되지 않은 체크박스가 있으면 alert 띄우고 focus 이동
    if (firstUnchecked) {
        firstUnchecked.focus();  // 가장 위에 있는 체크박스로 focus 이동
        firstUnchecked.style.outline = "2px solid red"; // 포커스를 시각적으로 구분하기 위해 스타일 추가
        alert('필수 약관을 동의해주세요');
        return false; // 폼 제출을 막음
    }

    return true; // 모든 필수 체크박스가 동의되었으면 폼 제출
}

// 체크박스 클릭 시 전체 동의 체크박스를 업데이트
function addCheckboxEventListeners() {
    document.getElementById('collectPersonalInfo').addEventListener('change', updateFinalAgreeCheckbox);
    document.getElementById('usePersonalInfo').addEventListener('change', updateFinalAgreeCheckbox);
    document.getElementById('dataRetention').addEventListener('change', updateFinalAgreeCheckbox);
    document.getElementById('thirdParty').addEventListener('change', updateFinalAgreeCheckbox);
    document.getElementById('privacyProtection').addEventListener('change', updateFinalAgreeCheckbox);
    document.getElementById('userRights').addEventListener('change', updateFinalAgreeCheckbox);
    document.getElementById('marketingConsent').addEventListener('change', updateFinalAgreeCheckbox);  // Optional, but still updates final agree checkbox
}

// 페이지 로드 후 이벤트 리스너 추가
window.onload = function() {
    addCheckboxEventListeners();
};

// 개인정보 처리동의 (선택) 사항 join.jsp 전달 (hidden)
function updateMarketingConsent() {
            var marketingCheckbox = document.getElementById("marketingConsent");
            var marketingConsentHidden = document.getElementById("marketingConsentHidden");

            // Update the hidden field value based on checkbox state
            if (marketingCheckbox.checked) {
                marketingConsentHidden.value = "yes"; // When checked, set to 'yes'
            } else {
                marketingConsentHidden.value = "no"; // When unchecked, set to 'no'
            }
        }

        // Attach the function to checkbox change event
        window.onload = function() {
            document.getElementById("marketingConsent").addEventListener("change", updateMarketingConsent);
        }
