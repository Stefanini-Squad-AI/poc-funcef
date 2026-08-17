unit FSelPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwtable, Wwdatsrc, ExtCtrls, wwdblook, Spin,
  StdCtrls, TEdNum, MAHlpBtn, Buttons, Wwquery, ComCtrls, uAutorizacao, TB97,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmSelPessoal = class(TfrmOkCancelar)
    ds: TwwDataSource;
    pnSelecao: TPanel;
    pnResult: TPanel;
    tblCargo: TwwQuery;
    tblSindic: TwwQuery;
    tblProfis: TwwQuery;
    tblPessoal: TwwQuery;
    PageControl1: TPageControl;
    tsDadosFunc: TTabSheet;
    tsDadosPess: TTabSheet;
    tsDadosOutros: TTabSheet;
    gbxSitPlano: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxCancelados: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    ednSal1: TEditNum;
    ednSal2: TEditNum;
    gbxTempAdm: TGroupBox;
    Label1: TLabel;
    ednAdm1: TSpinEdit;
    ednAdm2: TSpinEdit;
    gbxTempCar: TGroupBox;
    Label3: TLabel;
    ednCar1: TSpinEdit;
    ednCar2: TSpinEdit;
    rgSelEstab: TRadioGroup;
    gbxEstab: TGroupBox;
    dblcEstab: TwwDBLookupCombo;
    lstEstab: TListBox;
    rgSelSindi: TRadioGroup;
    gbxSindi: TGroupBox;
    dblcSindi: TwwDBLookupCombo;
    lstSindi: TListBox;
    lstCodSindi: TListBox;
    gbxLotacao: TGroupBox;
    dblcLotacao: TwwDBLookupCombo;
    bbtnOutraVez: TBitBtn;
    rgSelCargo: TRadioGroup;
    gbxCargo: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    lstCargo: TListBox;
    lstCodCargo: TListBox;
    lstCodEstab: TListBox;
    tblEstab: TwwQuery;
    tblLotacao: TwwQuery;
    qryGrauInstr: TwwQuery;
    cbxAssistidos: TCheckBox;
    qryPlano: TwwQuery;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    rgSelPlano: TRadioGroup;
    gbxPlano: TGroupBox;
    dblcPlano: TwwDBLookupCombo;
    lstPlano: TListBox;
    lstCodPlano: TListBox;
    cbxMantidos: TCheckBox;
    cbxMantidoParc: TCheckBox;
    cbxManutSaldo: TCheckBox;
    rgSelPatro: TRadioGroup;
    gbxPatro: TGroupBox;
    dblcPatro: TwwDBLookupCombo;
    lstPatro: TListBox;
    lstCodPatro: TListBox;
    qryPatro: TwwQuery;
    gbxIdade: TGroupBox;
    Label5: TLabel;
    ednIda1: TSpinEdit;
    ednIda2: TSpinEdit;
    gbxSexo: TGroupBox;
    cbxFeminino: TCheckBox;
    cbxMasculino: TCheckBox;
    gbxProfis: TGroupBox;
    dblcProfis: TwwDBLookupCombo;
    gbxGrauInstr: TGroupBox;
    dblcGrauInstr: TwwDBLookupCombo;
    rgSinal: TRadioGroup;
    gbxCep: TGroupBox;
    Label6: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    gbxAniv: TGroupBox;
    cbxAniv: TComboBox;
    GroupBox1: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    rgSinTot: TRadioGroup;
    speDepTot: TSpinEdit;
    speDepIR: TSpinEdit;
    rgSinIR: TRadioGroup;
    gbxEstCivil: TGroupBox;
    cbxSolt: TCheckBox;
    cbxCas: TCheckBox;
    cbxSep: TCheckBox;
    cbxViu: TCheckBox;
    cbxOutr: TCheckBox;
    cbxSepJud: TCheckBox;
    cbxDes: TCheckBox;
    procedure dblcProfisCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcGrauInstrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rgSelEstabClick(Sender: TObject);
    procedure rgSelCargoClick(Sender: TObject);
    procedure rgSelSindiClick(Sender: TObject);
    procedure dblcEstabCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCargoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcSindiCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstEstabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstCargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstSindiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcLotacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure ednCar1Change(Sender: TObject);
    procedure ednIda1Change(Sender: TObject);
    procedure ednCar2Change(Sender: TObject);
    procedure ednIda2Change(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure rgSelPlanoClick(Sender: TObject);
    procedure lstPlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rgSelPatroClick(Sender: TObject);
    procedure dblcPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstPatroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelPessoal: TfrmSelPessoal;
  SvItem : Integer;
  J, VAL1, VAL2 : Integer;
  sSql : String;
  VALOR : Double;
  TituSeq : Array[0..9] of string =  ('Nome',
                                      'Inscrição',
                                      'Patrocinadora,Nome',
                                      'Patrocinadora,Matrícula',
                                      'Plano,Nome',
                                      'Plano,Inscrição',
                                      'Patrocinadora,Plano,Nome',
                                      'Patrocinadora,Plano,Inscrição',
                                      'Plano,Patrocinadora,Nome',
                                      'Plano,Patrocinadora,Matrícula');

  TituOrdF : Array[0..9] of string =
           ('upper(Pessoa.Nome)',
            'INSCRICAONUMERO',
            'ELEGPATRO.IdPessJur,upper(Pessoa.Nome)',
            'ELEGPATRO.IdPessJur,Matricula',
            'IDPLANOPREV,upper(Pessoa.Nome)',
            'IDPLANOPREV,INSCRICAONUMERO',
            'ELEGPATRO.IdPessJur,IDPLANOPREV,upper(Pessoa.Nome)',
            'ELEGPATRO.IdPessJur,IDPLANOPREV,INSCRICAONUMERO',
            'IDPLANOPREV,ELEGPATRO.IdPessJur,upper(Pessoa.Nome)',
            'IDPLANOPREV,ELEGPATRO.IdPessJur,Matricula');


implementation

uses USistema, UMensErro;

{$R *.DFM}


procedure TfrmSelPessoal.dblcProfisCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  {dblcProfis}(Sender as TwwDBLookupCombo).Text :=
           trim(tblProfis.FieldByName('IDPROFISS').AsString);
end;

procedure TfrmSelPessoal.dblcGrauInstrCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  {dblcGrauInstr}(Sender as TwwDBLookupCombo).Text :=
            trim(qryGrauInstr.FieldByName('IDGRINSTR').AsString);
end;

procedure TfrmSelPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  ds.Dataset.Filtered := False;
  tblProfis.Open;
  qryGrauInstr.Open;
//  qryRamo.Open;
//  tblCargo.Open;
//  tblSindic.Open;
//  tblEstab.Open;
  tblLotacao.Open;
  dblcLotacao.SelText := '**********';
  cmbSequencia.ItemIndex := 0;
  cmbSequencia.Text := TituSeq[0];
end;

procedure TfrmSelPessoal.rgSelEstabClick(Sender: TObject);
begin
  inherited;
  if  (rgSelEstab.ItemIndex = 1) and  (not tblEstab.Active)  then  tblEstab.Open;
  if tblEstab.EOF  then  rgSelEstab.ItemIndex := 0;
  gbxEstab.Visible := (rgSelEstab.ItemIndex = 1);
end;

procedure TfrmSelPessoal.rgSelCargoClick(Sender: TObject);
begin
  inherited;
  if  (rgSelCargo.ItemIndex = 1) and  (not tblCargo.Active)  then  tblCargo.Open;
  if tblCargo.EOF  then  rgSelCargo.ItemIndex := 0;
  gbxCargo.Visible := (rgSelCargo.ItemIndex = 1);
end;

procedure TfrmSelPessoal.rgSelSindiClick(Sender: TObject);
begin
  inherited;
  if  (rgSelSindi.ItemIndex = 1) and  (not tblSindic.Active)  then  tblSindic.Open;
  if tblSindic.EOF  then  rgSelSindi.ItemIndex := 0;
  gbxSindi.Visible := (rgSelSindi.ItemIndex = 1);
end;

procedure TfrmSelPessoal.dblcEstabCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstEstab.Items.Add(tblEstab.FieldByName('NOME').Value);
     lstCodEstab.Items.Add(tblEstab.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelPessoal.dblcCargoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstCargo.Items.Add(tblCargo.FieldByName('TITULO').Value);
     lstCodCargo.Items.Add(tblCargo.FieldByName('IDCARGOEXT').AsString);
  end;
end;

procedure TfrmSelPessoal.dblcSindiCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstSindi.Items.Add(tblSindic.FieldByName('NOME').Value);
     lstCodSindi.Items.Add(tblSindic.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelPessoal.lstEstabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstEstab.Items.Count > 0)  then begin
      SvItem := lstEstab.ItemIndex;
      lstEstab.Items.Delete(SvItem);
      lstCodEstab.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.lstCargoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstCargo.Items.Count > 0)  then begin
      SvItem := lstCargo.ItemIndex;
      lstCargo.Items.Delete(SvItem);
      lstCodCargo.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.lstSindiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstSindi.Items.Count > 0)  then begin
      SvItem := lstSindi.ItemIndex;
      lstSindi.Items.Delete(SvItem);
      lstCodSindi.Items.Delete(SvItem);
  end;
end;


procedure TfrmSelPessoal.dblcLotacaoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (modified) and (not tblLotacao.Eof) then
  {dblcLotacao}(Sender as TwwDBLookupCombo).Text :=
      tblLotacao.FieldByName('CODCENTROCUSTO').Value;
end;

procedure TfrmSelPessoal.ednAdm2Change(Sender: TObject);
begin
  inherited;
  if ednAdm2.Value < ednAdm1.Value then ednAdm2.Value := ednAdm1.Value;
end;

procedure TfrmSelPessoal.ednAdm1Change(Sender: TObject);
begin
  inherited;
  if ednAdm1.Value > ednAdm2.Value then ednAdm1.Value := ednAdm2.Value;
end;

procedure TfrmSelPessoal.ednCar1Change(Sender: TObject);
begin
  inherited;
  if ednCar1.Value > ednCar2.Value then ednCar1.Value := ednCar2.Value;
end;

procedure TfrmSelPessoal.ednIda1Change(Sender: TObject);
begin
  inherited;
  if ednIda1.Value > ednIda2.Value then ednIda1.Value := ednIda2.Value;
end;

procedure TfrmSelPessoal.ednCar2Change(Sender: TObject);
begin
  inherited;
  if ednCar2.Value < ednCar1.Value then ednCar2.Value := ednCar1.Value;
end;

procedure TfrmSelPessoal.ednIda2Change(Sender: TObject);
begin
  inherited;
  if ednIda2.Value < ednIda1.Value then ednIda2.Value := ednIda1.Value;
end;

procedure TfrmSelPessoal.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ds.Dataset.Filtered := False;
  bbtnOutraVez.Visible := False;
  //bbtnCancelar.Caption := '&Cancelar';
  //rgSequencia.Visible := True;
  pnResult.Visible := False;
  //gbxLotacao.Visible := True;
  bbtnConfirmar.Visible := True;

end;



procedure TfrmSelPessoal.bbtnConfirmarClick(Sender: TObject);
var
  i: integer;
  sEstab, sCargo, sSindi, sPlano, sPatro : String;
  MarcouFuncionario, MarcouParticipante : Boolean;
begin
  inherited;
  MarcouFuncionario  := (cbxAtivos.Checked) or (cbxAfastados.Checked)  or
                        (cbxDemitidos.Checked);
  MarcouParticipante := (cbxEfetivos.Checked) or (cbxAssistidos.Checked)  or
                        (cbxCancelados.Checked);

  if  (not MarcouParticipante) then begin
      MsgDlg('Assinale Ao Menos Um Tipo de Situação na Fundação',
              'Aviso', mtInformation, [mbOk,mbHelp], 0);
      PageControl1.ActivePage := tsDadosFunc;
      gbxSitPlano.SetFocus;
      exit;
  end;

  if  (not MarcouFuncionario) then begin
      MsgDlg('Assinale Ao Menos Um Tipo de Situação na Patrocinadora',
              'Aviso', mtInformation, [mbOk,mbHelp], 0);
      PageControl1.ActivePage := tsDadosFunc;
      gbxSituacao.SetFocus;
      exit;
  end;

  if  (rgSelEstab.ItemIndex > 0) then begin
      sEstab := '(';
      for  I := 0  to  (lstEstab.Items.Count - 1)  do begin
          if lstEstab.Items[I] = ''  then  break;
          if  I > 0  then  sEstab := sEstab + ',';
          sEstab := sEstab + lstCodEstab.Items[I];
      end;
      sEstab := sEstab + ')';
  end;

  if  (rgSelCargo.ItemIndex > 0) then begin
      sCargo := '(';
      for  I := 0  to  (lstCargo.Items.Count - 1)  do begin
          if lstCargo.Items[I] = ''  then  break;
          if  I > 0  then  sCargo := sCargo + ',';
          sCargo := sCargo + lstCodCargo.Items[I];
      end;
      sCargo := sCargo + ')';
  end;

  if  (rgSelSindi.ItemIndex > 0) then begin
      sSindi := '(';
      for  I := 0  to  (lstSindi.Items.Count - 1)  do begin
          if lstSindi.Items[I] = ''  then  break;
          if  I > 0  then  sSindi := sSindi + ',';
          sSindi := sSindi + lstCodSindi.Items[I];
      end;
      sSindi := sSindi + ')';
  end;

  if  (rgSelPlano.ItemIndex > 0) then begin
      sPlano := '(';
      for  I := 0  to  (lstPlano.Items.Count - 1)  do begin
          if lstPlano.Items[I] = ''  then  break;
          if  I > 0  then  sPlano := sPlano + ',';
          sPlano := sPlano + lstCodPlano.Items[I];
      end;
      sPlano := sPlano + ')';
  end;

  if  (rgSelPatro.ItemIndex > 0) then begin
      sPatro := '(';
      for  I := 0  to  (lstPatro.Items.Count - 1)  do begin
          if lstPatro.Items[I] = ''  then  break;
          if  I > 0  then  sPatro := sPatro + ',';
          sPatro := sPatro + lstCodPatro.Items[I];
      end;
      sPatro := sPatro + ')';
  end;

  tblPessoal.SQL.Clear;
  sSql := 'SELECT PESSOA.NOME, PESSOA.TIPO, PESSOA.NUMDOCUMENTO, ';
  sSql := sSql + 'PESSOAFISICA.*, CIDADES.NOME AS CIDADE, ';
  sSql := sSql + 'ENDPESS.LOGRADOURO, ';
  sSql := sSql + 'ENDPESS.CODESTADO, ';
  sSql := sSql + 'ENDPESS.NUMERO, ';
  sSql := sSql + 'ENDPESS.COMPLEMENTO, ';
  sSql := sSql + 'ENDPESS.BAIRRO, ';
  sSql := sSql + 'ENDPESS.CEP, ';
  sSql := sSql + 'ELEGPATRO.*, SITFUNC.*, PARTPREVPLAN.IDPLANOPREV, ';
  sSql := sSql + 'PARTPREVPLAN.INSCRICAONUMERO, PARTPREVPLAN.INSCRICAODATA ';
  sSql := sSql + 'FROM PESSOA, PESSOAFISICA, ENDPESS, CIDADES, ';
  sSql := sSql + 'ELEGPATRO, SITFUNC, SITPART, PARTPREVPLAN, PROCESSOTRAB ';
  sSql := sSql + 'WHERE PESSOA.IDPESSOA   = PESSOAFISICA.IDPESSOA  AND ';
  sSql := sSql + 'PESSOA.IDENDRESIDENCIAL = ENDPESS.IDENDERECO(+)  AND ';
  sSql := sSql + 'ENDPESS.IDCIDADES       = CIDADES.IDCIDADES(+)   AND ';
  sSql := sSql + 'PESSOA.IDPESSOA         = PROCESSOTRAB.IDRECLAMANTE  AND ';
  sSql := sSql + 'PROCESSOTRAB.INDMATERIA IN (2,3) AND ';
  sSql := sSql + 'ELEGPATRO.IDPESSOA     = PESSOA.IDPESSOA        AND ';
  sSql := sSql + 'ELEGPATRO.IDSITFUNC    = SITFUNC.IDSITFUNC(+)   AND ';
  sSql := sSql + 'ELEGPATRO.IDPESSJUR    = PARTPREVPLAN.IDPESSJUR AND ';
  sSql := sSql + 'PARTPREVPLAN.IDPESSOA  = PESSOA.IDPESSOA        AND ';
  sSql := sSql + 'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART(+)   AND ';

  if  (not cbxAtivos.Checked)  then
      sSql := sSql + ' SITFUNC.TIPOSIT <> ''A'' AND ';
  if  (not cbxAfastados.Checked)  then
      sSql := sSql + ' SITFUNC.TIPOSIT <> ''F'' AND ';
  if  (not cbxDemitidos.Checked)  then
      sSql := sSql + ' SITFUNC.TIPOSIT <> ''D'' AND ';


  if  (not cbxEfetivos.Checked)  then
      sSql := sSql + ' SITPART.FLGINTERNO <> ''AT'' AND ';
  if  (not cbxMantidos.Checked)  then
      sSql := sSql + ' SITPART.FLGINTERNO <> ''MA'' AND ';
  if  (not cbxMantidoParc.Checked)  then
      sSql := sSql + ' SITPART.FLGINTERNO <> ''MP'' AND ';
  if  (not cbxAssistidos.Checked)  then
      sSql := sSql + ' SITPART.FLGINTERNO <> ''AS'' AND ';
  if  (not cbxManutSaldo.Checked)  then
      sSql := sSql + ' SITPART.FLGINTERNO <> ''MS'' AND ';
  if  (not cbxCancelados.Checked)  then
      sSql := sSql + ' SITPART.FLGINTERNO <> ''CA'' AND ';


  if  (rgSelEstab.ItemIndex > 0)  then
      sSql := sSql + ' ELEGPATRO.IDESTAB IN ' + sEstab + ' AND ';

  if  (rgSelPlano.ItemIndex > 0)  then
      sSql := sSql + ' PARTPREVPLAN.IDPLANOPREV IN ' + sPlano + ' AND ';

  if  (dblcLotacao.Text <> '**********') then
       for  I := 1  to  length(trim(dblcLotacao.Text))  do
            if  (copy(dblcLOTACAO.Text, I, 1) <> '*')  then
                sSql := sSql + ' SUBSTR(ELEGPATRO.CODCENTROCUSTO, ' + IntToStr(I) +
                               ' , 1) = ''' + copy(dblcLOTACAO.Text, I, 1) + ''' AND ';

  if  (ednAdm1.VALUE > 0)   then  begin //Tempo de Casa
     sSql := sSql + '(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),7,10)) -';
     sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),7,10))) * 12 +';
     sSql := sSql + ' to_number(substr(to_char(sysdate,''dd/mm/yyyy''),4,2)) -';
     sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),4,2)) + ';
     sSql := sSql + ' decode((to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) - ';
     sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2))) / ';
     sSql := sSql + ' decode(substr(to_char(sysdate,''dd/mm/yyyy''),1,2), ';
     sSql := sSql + ' substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2),1, ';
     sSql := sSql + ' abs(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) - ';
     sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
     sSql := sSql + ' >= ' + IntToStr(ednAdm1.VALUE) + ' AND ';
  end;
  if  (ednAdm2.VALUE < 999)  then  begin //Tempo de Casa
     sSql := sSql + '(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),7,10)) -';
     sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),7,10))) * 12 +';
     sSql := sSql + ' to_number(substr(to_char(sysdate,''dd/mm/yyyy''),4,2)) -';
     sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),4,2)) + ';
     sSql := sSql + ' decode((to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) - ';
     sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2))) / ';
     sSql := sSql + ' decode(substr(to_char(sysdate,''dd/mm/yyyy''),1,2), ';
     sSql := sSql + ' substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2),1, ';
     sSql := sSql + ' abs(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) - ';
     sSql := sSql + ' to_number(substr(to_char(dataadmissao,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
     sSql := sSql + ' <= ' + IntToStr(ednAdm2.VALUE) + ' AND ';
  end;

  if  (ednCar1.VALUE > 0)   then  begin //Tempo na Fundação
     sSql := sSql + '(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),7,10)) -';
     sSql := sSql + ' to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),7,10))) * 12 +';
     sSql := sSql + ' to_number(substr(to_char(sysdate,''dd/mm/yyyy''),4,2)) -';
     sSql := sSql + ' to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),4,2)) + ';
     sSql := sSql + ' decode((to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) - ';
     sSql := sSql + ' to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2))) / ';
     sSql := sSql + ' decode(substr(to_char(sysdate,''dd/mm/yyyy''),1,2), ';
     sSql := sSql + ' substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2),1, ';
     sSql := sSql + ' abs(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) - ';
     sSql := sSql + ' to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
     sSql := sSql + ' >= ' + IntToStr(ednCar1.VALUE) + ' AND ';
  end;
  if  (ednCar2.VALUE < 999)  then  begin //Tempo na Fundação
     sSql := sSql + '(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),7,10)) -';
     sSql := sSql + ' to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),7,10))) * 12 +';
     sSql := sSql + ' to_number(substr(to_char(sysdate,''dd/mm/yyyy''),4,2)) -';
     sSql := sSql + ' to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),4,2)) + ';
     sSql := sSql + ' decode((to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) - ';
     sSql := sSql + ' to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2))) / ';
     sSql := sSql + ' decode(substr(to_char(sysdate,''dd/mm/yyyy''),1,2), ';
     sSql := sSql + ' substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2),1, ';
     sSql := sSql + ' abs(to_number(substr(to_char(sysdate,''dd/mm/yyyy''),1,2)) - ';
     sSql := sSql + ' to_number(substr(to_char(INSCRICAODATA,''dd/mm/yyyy''),1,2)))),-1,-1,0) ';
     sSql := sSql + ' <= ' + IntToStr(ednCar2.VALUE) + ' AND ';
  end;

  if  (StrToInt(ednSal1.Text) > 0)  then  begin //Faixa de Salário Particip.
     sSql := sSql + 'SALPARTICIPACAO >= ' +  (ednSal1.Text) + ' AND ';
  end;
  if  (StrToInt(ednSal2.Text) <> 999999999)  then  begin //Faixa de Salário Particip.
     sSql := sSql + 'SALPARTICIPACAO <= ' +  (ednSal2.Text) + ' AND ';
  end;
                
  if  (not cbxFeminino.Checked)  then
      sSql := sSql + 'PESSOAFISICA.SEXO <> ''F'' AND ';
  if  (not cbxMasculino.Checked)  then
      sSql := sSql + 'PESSOAFISICA.SEXO <> ''M'' AND ';

  if  (not cbxSolt.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''S'' AND ';
  if  (not cbxCas.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''C'' AND ';
  if  (not cbxSep.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''D'' AND ';
  if  (not cbxSepJud.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''J'' AND ';
  if  (not cbxDes.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''E'' AND ';
  if  (not cbxViu.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''V'' AND ';
  if  (not cbxOutr.Checked)  then
      sSql := sSql + 'PESSOAFISICA.ESTCIVIL <> ''O'' AND ';

  if  (rgSelCargo.ItemIndex > 0)  then
      sSql := sSql + ' IDCARGOEXT IN ' + sCargo + ' AND ';

  if  (rgSelSindi.ItemIndex > 0)  then
      sSql := sSql + ' IDSINDICATO IN ' + sSindi + ' AND ';

  if  (ednIda1.VALUE > 0)  then  //Faixa Etária
      sSql := sSql + '(SYSDATE - DATANASC)/365.25 >= ' + IntToStr(ednIda1.VALUE) + ' AND ';
  if  (ednIda2.VALUE < 99) then  //Faixa Etária
      sSql := sSql + '(SYSDATE - DATANASC)/365.25 <= ' + IntToStr(ednIda2.VALUE) + ' AND ';

  if  cbxAniv.ItemIndex > 0  then  begin  // Mês do Aniversário
      sSql := sSql + 'to_number(substr(to_char(DATANASC,''dd/mm/yyyy''),4,2)) = ';
      sSql := sSql + IntToStr(cbxAniv.ItemIndex) + ' AND ';
  end;

  if  (round(StrToInt(ednCep1.Text)) > 0)      then   //Faixa de CEP
      sSql := sSql + 'to_number(CEP)/1000 >= ' + ednCep1.Text + ' AND ';
  if  (round(StrToInt(ednCep2.Text)) < 99999)  then   //Faixa de CEP
      sSql := sSql + 'to_number(CEP)/1000 <= ' + ednCep2.Text + ' AND ';

  if  rgSinal.ItemIndex > -1  then begin
      sSql := sSql + 'IDGRINSTR ';  //Grau de Instrução
      if  rgSinal.ItemIndex = 0  then  sSql := sSql + ' <= ';
      if  rgSinal.ItemIndex = 1  then  sSql := sSql + ' = ';
      if  rgSinal.ItemIndex = 2  then  sSql := sSql + ' >= ';
      sSql := sSql + dblcGrauInstr.Text + ' AND ';
  end;

  val(dblcProfis.Text,VAL1,J);  //Profissão
  if  VAL1 > 0  then
      sSql := sSql + 'IDPROFISS = ' +  dblcProfis.Text + ' AND ';

  if (rgSinTot.ItemIndex < 2)  or  (speDepTot.Value > 0)  then begin // Total Benef. ??????
      if (rgSinTot.ItemIndex = 0)  then
          sSql := sSql + 'NUMDEPTOT <= ' +  IntToStr(speDepTot.Value) + ' AND ';
      if (rgSinTot.ItemIndex = 1)  then
          sSql := sSql + 'NUMDEPTOT  = ' +  IntToStr(speDepTot.Value) + ' AND ';
      if (rgSinTot.ItemIndex = 2)  then
          sSql := sSql + 'NUMDEPTOT >= ' +  IntToStr(speDepTot.Value) + ' AND ';
  end;

  if  (rgSinIR.ItemIndex < 2)  or  (speDepIR.Value > 0)  then begin // Dependentes IRRF
      if (rgSinIR.ItemIndex = 0)  then
          sSql := sSql + 'NUMDEPIRRF <= ' +  IntToStr(speDepIR.Value) + ' AND ';
      if (rgSinIR.ItemIndex = 1)  then
          sSql := sSql + 'NUMDEPIRRF  = ' +  IntToStr(speDepIR.Value) + ' AND ';
      if (rgSinIR.ItemIndex = 2)  then
          sSql := sSql + 'NUMDEPIRRF >= ' +  IntToStr(speDepIR.Value) + ' AND ';
  end;

  if  uppercase(Copy(sSQL, Length(sSQL)- 3, 3)) = 'AND' then
      sSQL := Copy(sSQL, 1, Length(sSQL)-4);

  sSql := sSql + ' order by ' + TituOrdF[cmbSequencia.ItemIndex];

  tblPessoal.SQL.Add(sSql);

  tblPessoal.Open;
  bbtnOutraVez.Visible := True;
  bbtnConfirmar.Visible := False;
  //bbtnCancelar.Caption := '&Sair';
  pnResult.Visible := True;
  //rgSequencia.Visible := False;
  //gbxLotacao.Visible := False;
  ModalResult := mrOk;
end;





procedure TfrmSelPessoal.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ds.Dataset.Filtered := False;
end;




procedure TfrmSelPessoal.rgSelPlanoClick(Sender: TObject);
begin
  inherited;
  if  (rgSelPlano.ItemIndex = 1) and  (not qryPlano.Active)  then  qryPlano.Open;
  if  qryPlano.EOF  then  rgSelPlano.ItemIndex := 0;
  gbxPlano.Visible := (rgSelPlano.ItemIndex = 1);
end;

procedure TfrmSelPessoal.lstPlanoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstPlano.Items.Count > 0)  then begin
      SvItem := lstPlano.ItemIndex;
      lstPlano.Items.Delete(SvItem);
      lstCodPlano.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.dblcPlanoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstPlano.Items.Add(qryPlano.FieldByName('NOME').Value);
     lstCodPlano.Items.Add(qryPlano.FieldByName('IDPLANOPREV').AsString);
  end;
end;


procedure TfrmSelPessoal.rgSelPatroClick(Sender: TObject);
begin
  inherited;
  if  (rgSelPatro.ItemIndex = 1) and  (not qryPatro.Active)  then  qryPatro.Open;
  if  qryPatro.EOF  then  rgSelPatro.ItemIndex := 0;
  gbxPatro.Visible := (rgSelPatro.ItemIndex = 1);
end;

procedure TfrmSelPessoal.dblcPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstPatro.Items.Add(qryPatro.FieldByName('NOME').Value);
     lstCodPatro.Items.Add(qryPatro.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelPessoal.lstPatroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstPatro.Items.Count > 0)  then begin
      SvItem := lstPatro.ItemIndex;
      lstPatro.Items.Delete(SvItem);
      lstCodPatro.Items.Delete(SvItem);
  end;
end;

end.
