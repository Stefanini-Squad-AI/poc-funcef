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
    //bbtnOutraVez: TBitBtn;
    pnResult: TPanel;
    tblPessoal: TwwQuery;
    PageControl1: TPageControl;
    tsDadosFunc: TTabSheet;
    gbxTipo: TGroupBox;
    cbxJuridica: TCheckBox;
    bbtnOutraVez: TBitBtn;
    qryEstado: TwwQuery;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    rgEstado: TRadioGroup;
    gbxEstado: TGroupBox;
    dblcEstado: TwwDBLookupCombo;
    lstEstado: TListBox;
    lstCodEstado: TListBox;
    cbxFisica: TCheckBox;
    rgCidade: TRadioGroup;
    gbxCidade: TGroupBox;
    dblcCidade: TwwDBLookupCombo;
    lstCidade: TListBox;
    lstCodCidade: TListBox;
    qryCidade: TwwQuery;
    qryRecl: TwwQuery;
    gbxCep: TGroupBox;
    Label6: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    rgRecl: TRadioGroup;
    gbxRecl: TGroupBox;
    dblcRecl: TwwDBLookupCombo;
    lstRecl: TListBox;
    lstCodRecl: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure rgEstadoClick(Sender: TObject);
    procedure lstEstadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcEstadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rgCidadeClick(Sender: TObject);
    procedure dblcCidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgReclClick(Sender: TObject);
    procedure dblcReclCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lstReclKeyDown(Sender: TObject; var Key: Word;
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
  TituSeq : Array[0..5] of string = ('Nome',
                                     'Estado,Cidade,Nome',
                                     'Cidade,Nome',
                                     'Tipo de Pessoa,Nome',
                                     'Estado,Cidade,Tipo de Pessoa,Nome',
                                     'Cidade,Tipo de Pessoa,Nome');

  TituOrdF : Array[0..5] of string =
           ('upper(Pessoa.Nome)',
            'upper(Estado.NomeEstado),upper(Cidade),upper(Pessoa.Nome)',
            'upper(Cidade),upper(Pessoa.Nome)',
            'Pessoa.Tipo,upper(Pessoa.Nome)',
            'upper(Estado.NomeEstado),upper(Cidade),Pessoa.Tipo,upper(Pessoa.Nome)',
            'upper(Cidade),Pessoa.Tipo,upper(Pessoa.Nome');


implementation

uses USistema, UMensErro;

{$R *.DFM}


procedure TfrmSelPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  ds.Dataset.Filtered := False;

  qryEstado.Open;
  qryCidade.Open;
  qryRecl.Open;

  cmbSequencia.ItemIndex := 0;
  cmbSequencia.Text := TituSeq[0];
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
  I: integer;
  sEstado, sCidade, sRecl : String;
  MarcouJuridica, MarcouFisica : Boolean;
begin
  inherited;
  MarcouJuridica  := (cbxJuridica.Checked);
  MarcouFisica    := (cbxFisica.Checked);

  if  (not MarcouJuridica) and (not MarcouFisica) then begin
      MsgDlg('Assinale Ao Menos Um Tipo de Pessoa',
              'Aviso', mtInformation, [mbOk,mbHelp], 0);
      gbxTipo.SetFocus;
      exit;
  end;

  if  (rgEstado.ItemIndex > 0) then begin
      sEstado := '(';
      for  I := 0  to  (lstEstado.Items.Count - 1)  do begin
          if lstEstado.Items[I] = ''  then  break;
          if  I > 0  then  sEstado := sEstado + ',';
          sEstado := sEstado + lstCodEstado.Items[I];
      end;
      sEstado := sEstado + ')';
  end;

  if  (rgCidade.ItemIndex > 0) then begin
      sCidade := '(';
      for  I := 0  to  (lstCidade.Items.Count - 1)  do begin
          if lstCidade.Items[I] = ''  then  break;
          if  I > 0  then  sCidade := sCidade + ',';
          sCidade := sCidade + lstCodCidade.Items[I];
      end;
      sCidade := sCidade + ')';
  end;

  if  (rgRecl.ItemIndex > 0) then begin
      sRecl := '(';
      for  I := 0  to  (lstRecl.Items.Count - 1)  do begin
          if lstRecl.Items[I] = ''  then  break;
          if  I > 0  then  sRecl := sRecl + ',';
          sRecl := sRecl + lstCodRecl.Items[I];
      end;
      sRecl := sRecl + ')';
  end;

  tblPessoal.SQL.Clear;
  sSql := 'SELECT PESSOA.IDPESSOA, PESSOA.NOME, PESSOA.TIPO, PESSOA.NUMDOCUMENTO, ';
  sSql := sSql + 'CIDADES.NOME AS CIDADE, ';
  sSql := sSql + 'ENDPESS.LOGRADOURO, ';
  sSql := sSql + 'ENDPESS.CODESTADO, ';
  sSql := sSql + 'ENDPESS.NUMERO, ';
  sSql := sSql + 'ENDPESS.COMPLEMENTO, ';
  sSql := sSql + 'ENDPESS.BAIRRO, ';
  sSql := sSql + 'ENDPESS.CEP, ';
  sSql := sSql + 'ESTADO.NOMEESTADO ';
  sSql := sSql + 'FROM PESSOA, ENDPESS, CIDADES, ESTADO, PROCESSOTRAB ';
  sSql := sSql + 'WHERE ';
  sSql := sSql + ' PESSOA.IDPESSOA   = PROCESSOTRAB.IDRECLAMANTE  AND ';
  sSql := sSql + ' PROCESSOTRAB.INDMATERIA > 3  AND ';
  sSql := sSql + '((PESSOA.IDENDRESIDENCIAL =  ENDPESS.IDENDERECO AND ';
  sSql := sSql + '  PESSOA.TIPO = ''F'') OR ';
  sSql := sSql + ' (PESSOA.IDENDCOMERCIAL   =  ENDPESS.IDENDERECO AND ';
  sSql := sSql + '  PESSOA.TIPO = ''J'')) AND ';
  sSql := sSql + 'ENDPESS.IDCIDADES       =  CIDADES.IDCIDADES(+)  AND ';
  sSql := sSql + 'CIDADES.IDESTADO        =  ESTADO.IDESTADO(+)    AND ';


  if  (not MarcouJuridica)  then
      sSql := sSql + ' PESSOA.TIPO <> ''J'' AND ';
  if  (not MarcouFisica)  then
      sSql := sSql + ' PESSOA.TIPO <> ''F'' AND ';

  if  (rgEstado.ItemIndex > 0)  then
      sSql := sSql + ' ESTADO.IDESTADO IN ' + sEstado + ' AND ';

  if  (rgCidade.ItemIndex > 0)  then
      sSql := sSql + ' CIDADES.IDCIDADES IN ' + sCidade + ' AND ';

  if  (rgRecl.ItemIndex > 0)  then
      sSql := sSql + ' PESSOA.IDPESSOA IN ' + sRecl + ' AND ';

  if  (round(StrToInt(ednCep1.Text)) > 0)      then   //Faixa de CEP
      sSql := sSql + 'to_number(CEP)/1000 >= ' + ednCep1.Text + ' AND ';
  if  (round(StrToInt(ednCep2.Text)) < 99999)  then   //Faixa de CEP
      sSql := sSql + 'to_number(CEP)/1000 <= ' + ednCep2.Text + ' AND ';


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




procedure TfrmSelPessoal.rgEstadoClick(Sender: TObject);
begin
  inherited;
  if  (rgEstado.ItemIndex = 1) and  (not qryEstado.Active)  then  qryEstado.Open;
  if  qryEstado.EOF  then  rgEstado.ItemIndex := 0;
  gbxEstado.Visible := (rgEstado.ItemIndex = 1);
end;

procedure TfrmSelPessoal.lstEstadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstEstado.Items.Count > 0)  then begin
      SvItem := lstEstado.ItemIndex;
      lstEstado.Items.Delete(SvItem);
      lstCodEstado.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.dblcEstadoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstEstado.Items.Add(qryEstado.FieldByName('NOMEESTADO').Value);
     lstCodEstado.Items.Add(qryEstado.FieldByName('IDESTADO').AsString);
  end;
end;


procedure TfrmSelPessoal.rgCidadeClick(Sender: TObject);
begin
  inherited;
  if  (rgCidade.ItemIndex = 1) and  (not qryCidade.Active)  then  qryCidade.Open;
  if  qryCidade.EOF  then  rgCidade.ItemIndex := 0;
  gbxCidade.Visible := (rgCidade.ItemIndex = 1);
end;

procedure TfrmSelPessoal.dblcCidadeCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstCidade.Items.Add(qryCidade.FieldByName('NOME').Value);
     lstCodCidade.Items.Add(qryCidade.FieldByName('IDCIDADES').AsString);
  end;
end;

procedure TfrmSelPessoal.lstCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstCidade.Items.Count > 0)  then begin
      SvItem := lstCidade.ItemIndex;
      lstCidade.Items.Delete(SvItem);
      lstCodCidade.Items.Delete(SvItem);
  end;
end;

procedure TfrmSelPessoal.rgReclClick(Sender: TObject);
begin
  inherited;
  if  (rgRecl.ItemIndex = 1) and  (not qryRecl.Active)  then  qryRecl.Open;
  if  qryRecl.EOF  then  rgRecl.ItemIndex := 0;
  gbxRecl.Visible := (rgRecl.ItemIndex = 1);
end;

procedure TfrmSelPessoal.dblcReclCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then begin
     lstRecl.Items.Add(qryRecl.FieldByName('NOME').Value);
     lstCodRecl.Items.Add(qryRecl.FieldByName('IDPESSOA').AsString);
  end;
end;

procedure TfrmSelPessoal.lstReclKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  (Key = vk_Delete) and (lstRecl.Items.Count > 0)  then begin
      SvItem := lstRecl.ItemIndex;
      lstRecl.Items.Delete(SvItem);
      lstCodRecl.Items.Delete(SvItem);
  end;
end;

end.
