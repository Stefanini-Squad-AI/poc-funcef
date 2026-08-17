unit FParamRelLancnaoProcessados;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)  : Paulo Ramos
// Rotina    : Ajuste em querys
// Data      : 15/01/2007
// Pendencia : 18554
// Alteração : Tratar o campo SITENVIO como CHAR, colocando plics quando
//   necessário.
//-----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, ComCtrls,
  dBaseDados, uSistema;

type
  TFrmParamRelLancNaoProcecssados = class(TfrmOkCancelar)
    qryPatrocinadora: TwwQuery;
    qryPlano: TwwQuery;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    dbcmbPatrocinadora: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    dbCmbPlano: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboxMesCob: TComboBox;
    EditAnoCob: TEdit;
    UpDown1: TUpDown;
    cbxPatros: TCheckBox;
    cbxPlanos: TCheckBox;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cboxMesRef: TComboBox;
    EditAnoRef: TEdit;
    UpDown2: TUpDown;
    GroupBox6: TGroupBox;
    dbCmbRubrica: TwwDBLookupCombo;
    cbxRubricas: TCheckBox;
    qryRubrica: TwwQuery;
    GroupBox7: TGroupBox;
    cbxLancamentos: TCheckBox;
    cbbTipoLanc: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamRelLancNaoProcecssados: TFrmParamRelLancNaoProcecssados;

implementation

uses dRelLancNaoProcessados;

{$R *.DFM}

procedure TFrmParamRelLancNaoProcecssados.FormCreate(Sender: TObject);
begin
  inherited;
  cbxPatros.Checked := false;
  cbxPlanos.Checked := false;
  qryPatrocinadora.Open;
  qryPlano.Open;
  qryRubrica.Open;
end;

procedure TFrmParamRelLancNaoProcecssados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatrocinadora.Close;
  qryPlano.Close;
  qryRubrica.Close;
  Action := caFree;
end;

procedure TFrmParamRelLancNaoProcecssados.bbtnConfirmarClick(
  Sender: TObject);
  var
     ssql,cMesCob,cMesRef,cLanc : String;
     iMesCob,iMesRef : Integer;
begin
  inherited;
  // Grava Log Operações
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
  // Fim da gravação do Log Operacoes.  

  dtmRelLancNaoprocessados.qryprincipal.close;
  dtmRelLancNaoprocessados.qryprincipal.sql.clear;

  ssql := 'SELECT MATRICULA, RECEBEDOR, PATROCINADORA, PLANO, MESPROCESSAMENTO, '+
          ' MESCOB, MESREF, VALORREC, VALORDESC, DIFERENCA, IDRUBRICA, DESCRUBRICA '+
          ' FROM (SELECT EL.MATRICULA, PR.NOME AS RECEBEDOR, PE.NOME AS PATROCINADORA, '+
          ' PV.NOME AS PLANO, T.MESCOBRANCA AS MESPROCESSAMENTO, '+
          ' SUBSTR(T.MESCOBRANCA,6,2)||''/''||SUBSTR(T.MESCOBRANCA,1,4) AS MESCOB, '+
          ' SUBSTR(T.MESREFERENCIA,6,2)||''/''||SUBSTR(T.MESREFERENCIA,1,4) AS MESREF, '+
          ' T.VALOR AS VALORREC, T.VALORRECEBIDO AS VALORDESC, '+
          ' T.VALOR - NVL(T.VALORRECEBIDO,0) AS DIFERENCA, '+
          ' PD.CODPROVDESC AS IDRUBRICA, '+
          ' PD.DESCRPROVDESC AS DESCRUBRICA '+
          ' FROM TMPDESC T, PESSOA PR, PESSOA PE, ELEGPATRO EL, PROVDESC PD, '+
          ' PLANPREV PV '+
          ' WHERE T.LOTEPREVIA IS NULL ';
  If (trim(cboxMesCob.Text) <> '') then
  begin
     iMesCob := (cboxMesCob.ItemIndex + 1);
     cMesCob := inttostr(iMesCob);
     If StrtoInt(cMesCob) < 10 then
        cMesCob := '0'+cMesCob;
     ssql := ssql + ' AND T.MESCOBRANCA = '+QuotedStr(trim(editanocob.text)+'/'+cMesCob)+' ';
  end;

  If (trim(cboxMesRef.Text) <> '') then
  begin
     iMesRef := (cboxMesRef.ItemIndex + 1);
     cMesRef := inttostr(iMesRef);
     If StrtoInt(cMesRef) < 10 then
        cMesRef := '0'+cMesRef;
     ssql := ssql + ' AND T.MESREFERENCIA = '+QuotedStr(trim(editanoREF.text)+'/'+cMesRef)+' ';
  end;

  If not cbxRubricas.checked then
     If (dbCmbRubrica.Text <> '') Then
        ssql := ssql + 'AND   T.IDPROVENTO = '+dbCmbRubrica.LookupValue+' ';

  If not cbxLancamentos.checked then
     If (cbbTipoLanc.Text <> '') Then
     begin
        case cbbTipoLanc.ItemIndex of
             0: cLanc := 'A';
             1: cLanc := 'C';
             2: cLanc := 'E';
             3: cLanc := 'P';
        end;
        ssql := ssql + 'AND   T.FLGTIPODESC = '+QuotedStr(cLanc)+' ';
     end;

  ssql := ssql + ' AND T.FLGDESCFOLHA = ''B'' '+
                 ' AND (T.SITENVIO = ''0'' OR T.SITENVIO IS NULL) '+
                 ' AND T.IDPESSOA = PR.IDPESSOA '+
                 ' AND T.IDPESSJUR = EL.IDPESSJUR '+  
                 ' AND T.IDTITULAR = EL.IDPESSOA '+
                 ' AND T.IDPROVENTO = PD.IDPROVENTO ';
  If not cbxPatros.checked then
     If (dbcmbPatrocinadora.Text <> '') Then
        ssql := ssql + 'AND   T.IDPESSJUR = '+dbcmbPatrocinadora.LookupValue+' ';

  If not cbxPlanos.checked then
     If (dbCmbPlano.Text <> '') Then
        ssql := ssql + 'AND   PV.IDPLANOPREV = '+dbCmbPlano.LookupValue+' ';

  ssql := ssql +' AND T.IDPESSJUR  = PE.IDPESSOA '+
                ' ORDER BY PE.NOME, PV.NOME,EL.MATRICULA, T.IDPROVENTO)';

  dtmRelLancNaoprocessados.qryprincipal.sql.add(ssql);
  dtmRelLancNaoprocessados.qryprincipal.Open;

end;

end.
