// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelEvSalPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Spin, MontaSelect,UDataBase;

type
  TfrmParamRelEvSalPart = class(TfrmOkCancelar)
    grpMesRef: TGroupBox;
    cbMes: TComboBox;
    dbseAno: TSpinEdit;
    dblkpPatro: TCMDBLookupCombo;
    Label1: TLabel;
    qryPatro: TwwQuery;
    grpboxPart: TGroupBox;
    btnProc: TBitBtn;
    MontaSelect: TMontaSelect;
    edNome: TEdit;
    chkTodosPart: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure fzqry;
    procedure btnProcClick(Sender: TObject);
    procedure dblkpPatroChange(Sender: TObject);
    procedure dblkpPatroExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelEvSalPart: TfrmParamRelEvSalPart;
  wDia,wMes,wAno : Word;
  wDataCob, ssql : String;

implementation

uses dRelatorios,UMensErro, UFuncoesUteis, UAdmPrev;

{$R *.DFM}

procedure TfrmParamRelEvSalPart.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;

  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  MontaSelect.Filtro.Add('ELEGPATRO.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

procedure TfrmParamRelEvSalPart.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (cbMes.ItemIndex+1) <= 9 then
     wDataCob := '01/0'+IntToStr(cbMes.ItemIndex+1)+'/'+Trim(dbseano.Text)
  else
     wDataCob := '01/'+IntToStr(cbMes.ItemIndex+1)+'/'+Trim(dbseano.Text);

// Criticar Dados
  if cbMes.ItemIndex = -1 then
    begin
     MsgDlg('Mês de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cbMes.SetFocus;
     Exit;
    end
  else if  dbseAno.Value = 0 then
    begin
     MsgDlg('Ano de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     dbseAno.Value := wAno;
     dbseano.SetFocus;
     Exit;
    end
  else if (MontaSelect.RetornouValor=False) and (chkTodosPart.Checked=False) then
    begin
     MsgDlg('Selecionar um participante ou todos. ','Erro',mtError,[mbOk,mbHelp],0);
     btnProc.SetFocus ;
     Exit;
    end
  else
    begin
      Fzqry;
      Fazquery(dtmRelatorios.qryEvSalPart,ssql);
    end;
end;

Procedure TfrmParamRelEvSalPart.Fzqry;
begin
      ssql := 'SELECT '+
              'QRY01.PATROCINADORA,' +
              'QRY01.ELEGIVEL, '+
              'QRY11.MESCOBRANCA   AS MESCOB11, '+
              'QRY11.VALORPROVENTO AS VPROV11, '+
              'QRY10.MESCOBRANCA   AS MESCOB10, '+
              'QRY10.VALORPROVENTO AS VPROV10, '+
              'QRY09.MESCOBRANCA   AS MESCOB09, '+
              'QRY09.VALORPROVENTO AS VPROV09, '+
              'QRY08.MESCOBRANCA   AS MESCOB08, '+
              'QRY08.VALORPROVENTO AS VPROV08, '+
              'QRY07.MESCOBRANCA   AS MESCOB07, '+
              'QRY07.VALORPROVENTO AS VPROV07, '+
              'QRY06.MESCOBRANCA   AS MESCOB06, '+
              'QRY06.VALORPROVENTO AS VPROV06, '+
              'QRY05.MESCOBRANCA   AS MESCOB05, '+
              'QRY05.VALORPROVENTO AS VPROV05, '+
              'QRY04.MESCOBRANCA   AS MESCOB04, '+
              'QRY04.VALORPROVENTO AS VPROV04, '+
              'QRY03.MESCOBRANCA   AS MESCOB03, '+
              'QRY03.VALORPROVENTO AS VPROV03, '+
              'QRY02.MESCOBRANCA   AS MESCOB02, '+
              'QRY02.VALORPROVENTO AS VPROV02, '+
              'QRY01.MESCOBRANCA   AS MESCOB01, '+
              'QRY01.VALORPROVENTO AS VPROV01, '+
              'QRY00.MESCOBRANCA   AS MESCOB0, '+
              'QRY00.VALORPROVENTO AS VPROV0 '+
              'FROM '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY00, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-1),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY01, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-2),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY02, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-3),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY03, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-4),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY04, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-5),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY05, '+
                           '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-6),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY06, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-7),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY07, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-8),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY08, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-9),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY09, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-10),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY10, '+
              '(SELECT H.MESCOBRANCA, '+
              'PET.NOME PATROCINADORA, '+
              'PE.NOME ELEGIVEL, '+
              'H.VALORPROVENTO  '+
              'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PATRO PT, PESSOA PE, PESSOA PET '+
              'WHERE  (H.MESCOBRANCA = TO_CHAR(ADD_MONTHS(TO_DATE('''+wDataCob+''',''dd/mm/yyyy''),-11),''yyyy/mm'')) ';
      if dblkpPatro.Text <> '' then
         ssql := ssql + 'AND (H.IDPESSJUR = '+dblkpPatro.LookUpValue+') ';
      if chkTodosPart.Checked = False then
         ssql := ssql + 'AND    (H.IDPESSOA = '+MontaSelect.ValoresChave[0]+') ';
              ssql := ssql + 'AND    (H.IDPESSJUR = R.IDPESSOA) '+
              'AND    (H.IDRUBRICA = R.IDRUBRICA) '+
              'AND    (R.IDRUBRICA = P.IDPROVENTO) '+
              'AND    (PT.IDPESSOA = H.IDPESSJUR) '+
              'AND    (PE.IDPESSOA = H.IDPESSOA) '+
              'AND    (PT.IDPESSOA = PET.IDPESSOA) '+
              'AND    (PT.IDRUBSALPARTICIP = H.IDRUBRICA )) QRY11 '+
              'WHERE QRY00.ELEGIVEL = QRY01.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY02.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY03.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY04.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY05.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY06.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY07.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY08.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY09.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY10.ELEGIVEL(+) '+
              'AND   QRY00.ELEGIVEL = QRY11.ELEGIVEL(+) ';

      dtmRelatorios.lblmesCob.Caption  := cbmes.Text+'/'+Trim(dbseano.Text);
      dtmRelatorios.lblMes11.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-10);
      dtmRelatorios.lblMes10.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-9);
      dtmRelatorios.lblMes09.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-8);
      dtmRelatorios.lblMes08.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-7);
      dtmRelatorios.lblMes07.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-6);
      dtmRelatorios.lblMes06.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-5);
      dtmRelatorios.lblMes05.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-4);
      dtmRelatorios.lblMes04.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-3);
      dtmRelatorios.lblMes03.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-2);
      dtmRelatorios.lblMes02.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex-1);
      dtmRelatorios.lblMes01.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex);
      dtmRelatorios.lblMesInf.Caption:=SubMeses(dbseAno.Text,cbMes.ItemIndex+1);
end;

procedure TfrmParamRelEvSalPart.btnProcClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA');
  MontaSelect.Filtro.Add('ELEGPATRO.IDPESSJUR = PJ.IDPESSOA');
  MontaSelect.Filtro.Add('ELEGPATRO.IDPESSJUR = '+dblkpPatro.LookupValue);

  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
     edNome.Text := MontaSelect.ValoresChave[1];
end;

procedure TfrmParamRelEvSalPart.dblkpPatroChange(Sender: TObject);
begin
  inherited;
  if dblkpPatro.Text = '' then
     grpboxPart.Enabled :=False
  else
     grpboxPart.Enabled :=True;

end;

procedure TfrmParamRelEvSalPart.dblkpPatroExit(Sender: TObject);
begin
  inherited;
  if dblkpPatro.Text <> '' then
     dblkpPatro.Enabled:=False;
end;

procedure TfrmParamRelEvSalPart.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;
  dblkpPatro.Text :='';
  edNome.Text :='';
  grpboxPart.Enabled:=False;
  cbMes.SetFocus;
end;

procedure TfrmParamRelEvSalPart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
end;

end.
