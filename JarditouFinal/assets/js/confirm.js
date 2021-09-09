// Confirmation du click via fenetre
function ConfirmMessage() {
    if (confirm("La suppression est \n IRREVERSIBLE \n confirmer ?")) {
        // Clic sur OK
        let article=document.getElementById('varMigrant').value;
        document.location.href="../php/deleteScript.php?pro_id="+article; 
        alert('Article '+article+' supprimé !');
    }
}