// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FGeraContnId;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Menus, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmGeraContnId = class(TfrmOkCancelar)
    qryTmpDesc: TwwQuery;
    dsTmpDesc: TwwDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    dbgdTmpDesc: TwwDBGrid;
    dbgdIncons: TwwDBGrid;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    qryIncons: TwwQuery;
    dsIncons: TwwDataSource;
    bbtnInclui: TBitBtn;
    bbtnTodos1: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    bbtnProcessar: TBitBtn;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    qryAux: TwwQuery;
    bbtnExclui: TBitBtn;
    bbtnTodos2: TBitBtn;
    UpdateSQL1: TUpdateSQL;
    UpdateSQL2: TUpdateSQL;

    procedure bbtnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnIncluiClick(Sender: TObject);
    procedure bbtnExcluiClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnTodos2Click(Sender: TObject);
    procedure bbtnTodos1Click(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);

  private { Private declarations }

    sMesCobrancaTela,
    sAnoCobrancaTela,
    sAnoMesCobrancaTela : string;


  public  { Public declarations }


  end;




var
  frmGeraContnId: TfrmGeraContnId;




implementation
{$R *.DFM}
uses 
  UAdmPrev, Faguarde,UMensErro, uSincronismo, usistema;




procedure TfrmGeraContnId.bbtnProcessarClick(Sender: TObject);
begin
  inherited;
  sAnoCobrancaTela := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMesCobrancaTela  := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesCobrancaTela  := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMesCobrancaTela    := sAnoCobrancaTela+'/'+sMesCobrancaTela;

  qryTmpDesc.close;
  if sMesCobrancaTela = '13' then
  begin
     qryTmpDesc.ParamByName('SMESREF').value  := sAnoCobrancaTela+'/12';
     qryTmpDesc.ParamByName('SMESREF1').value := sAnoMesCobrancaTela;
  end
  else
  begin
     qryTmpDesc.ParamByName('SMESREF').value  := sAnoMesCobrancaTela;
     qryTmpDesc.ParamByName('SMESREF1').value := sAnoMesCobrancaTela;
  end;

  qryTmpDesc.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryTmpDesc.open;

  if qryTmpDesc.IsEmpty then
  begin
     MsgDlg('Nao existem novas inconsistencias. ','Informação',mtInformation,[mbOk,mbHelp],0);
     cmbMesRef.SetFocus;
     exit;
  end;
  qryIncons.close;
  qryIncons.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryIncons.open;
end;



procedure TfrmGeraContnId.FormCreate(Sender: TObject);
begin
  inherited;
  qryTmpDesc.close;
  qryTmpDesc.ParamByName('SMESREF').value  := '';
  qryTmpDesc.ParamByName('SMESREF1').value := '';
  qryTmpDesc.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;  
  qryTmpDesc.open;

  qryIncons.close;

  qryAux.close;
  qryAux.open;
end;

procedure TfrmGeraContnId.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text      := cmbMesRef.Items[cmbMesRef.ItemIndex];
  end;                       
  spedAnoRef.Text := inttostr(AYear);
end;

procedure TfrmGeraContnId.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTmpDesc.close;
  qryIncons.close;
  qryAux.close;
end;

procedure TfrmGeraContnId.bbtnIncluiClick(Sender: TObject);
var
  sMesCob,sMatri,sMesRefer : string;
  sIdProv : integer;
begin
  inherited;

  if not qryTmpDesc.IsEmpty then
  begin
     qryIncons.Insert;

     qryIncons.fieldbyname('ANOMESREF').asstring      := qryTmpDesc.FieldByName('MESREFERENCIA').asstring;
     qryIncons.fieldbyname('ANOMESCOB').asstring      := qryTmpDesc.FieldByName('MESCOBRANCA').asstring;
     qryIncons.fieldbyname('TIPOOP').asinteger        := qryTmpDesc.FieldByName('FLGACEITANAOID').asinteger;
     qryIncons.fieldbyname('FLGTIPODESC').asstring    := 'P';
     qryIncons.fieldbyname('IDPESSJUR').asinteger     := qryTmpDesc.FieldByName('IDPESSJUR').asinteger;
     qryIncons.fieldbyname('IDPLANOPREV').asinteger   := qryTmpDesc.FieldByName('IDPLANOPREV').asinteger;
     qryIncons.fieldbyname('IDPESSOA').asinteger      := qryTmpDesc.FieldByName('IDPESSOA').asinteger;
     qryIncons.fieldbyname('SEQPROPOSTA').asinteger   := qryTmpDesc.FieldByName('SEQPROPOSTA').asinteger;
     qryIncons.fieldbyname('MATRICULA').asstring      := qryTmpDesc.FieldByName('MATRICULA').asstring;
     qryIncons.fieldbyname('IDDESCONTO').asinteger    := qryTmpDesc.FieldByName('IDDESCONTO').asinteger;
     qryIncons.fieldbyname('IDPROVENTO').asinteger    := qryTmpDesc.FieldByName('IDPROVENTO').asinteger;
     qryIncons.fieldbyname('DESCRICAO').asstring      := qryTmpDesc.FieldByName('DESCRICAO').asstring;
     qryIncons.fieldbyname('CODPROVDESC').asstring    := qryTmpDesc.FieldByName('CODPROVDESC').asstring;
     qryIncons.fieldbyname('IDMOTIVO').asinteger      := qryTmpDesc.FieldByName('IDMOTIVO').asinteger;
     qryIncons.fieldbyname('VALORESPERADO').asfloat   := qryTmpDesc.FieldByName('VALOR').asfloat;
     qryIncons.fieldbyname('VALORRECEBIDO').asfloat   := qryTmpDesc.FieldByName('VALORRECEBIDO').asfloat;

     qryIncons.Post;

     qryTmpDesc.Delete;
  end;

end;

procedure TfrmGeraContnId.bbtnExcluiClick(Sender: TObject);
begin
  inherited;

  if not qryIncons.IsEmpty then
  begin
     qryTmpDesc.insert;

     qryTmpDesc.FieldByName('MATRICULA').asstring      := qryIncons.fieldbyname('MATRICULA').asstring;
     qryTmpDesc.FieldByName('DESCRICAO').asstring      := qryIncons.fieldbyname('DESCRICAO').asstring;     
     qryTmpDesc.FieldByName('VALOR').asfloat           := qryIncons.fieldbyname('VALORESPERADO').asfloat;
     qryTmpDesc.FieldByName('VALORRECEBIDO').asfloat   := qryIncons.fieldbyname('VALORRECEBIDO').asfloat;

     qryTmpDesc.post;

     qryIncons.delete;
  end;

end;

procedure TfrmGeraContnId.bbtnConfirmarClick(Sender: TObject);
var
  sSQL : string;
begin
  inherited;
  qryTmpDesc.cancelupdates;
  qryIncons.first;
  qryIncons.applyupdates;

  qryIncons.first;
  frmAguarde.Mostra('');
  frmaguarde.pbAguarde.Min := 0;
  frmaguarde.pbAguarde.Max := qryIncons.RecordCount;

  while not qryIncons.eof do
  begin
     qryAux.close;
     qryAux.sql.clear;

     sSQL := ' UPDATE TMPDESC SET '+
             ' MESCOBRANCA = '''+SAnoMesPosterior(qryIncons.fieldbyname('ANOMESCOB').asstring)+''','+
             ' SITENVIO = '+'''0'''+
             ' WHERE MATRICULA = '''+qryIncons.fieldbyname('MATRICULA').asstring+
             ''' AND MESREFERENCIA = '''+qryIncons.fieldbyname('ANOMESREF').asstring+
             ''' AND  IDPROVENTO = '+inttostr(qryIncons.fieldbyname('IDPROVENTO').asinteger);
     qryAux.sql.add(sSQL);
     qryAux.ExecSQL;

      frmaguarde.pbAguarde.Position := qryIncons.RecNo;
     qryIncons.next;
  end;
  frmaguarde.Apaga;
  qryTmpDesc.close;
  qryIncons.close;
  cmbMesRef.SetFocus;

  Try
    If Not Sistema.GravaLogOperacoes(Self.Caption) Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

end;



procedure TfrmGeraContnId.bbtnTodos2Click(Sender: TObject);
begin
  inherited;
  qryIncons.first;

  if not qryIncons.IsEmpty then
  begin
     while not qryIncons.eof do
     begin
        qryTmpDesc.insert;

        qryTmpDesc.FieldByName('MATRICULA').asstring      := qryIncons.fieldbyname('MATRICULA').asstring;
        qryTmpDesc.FieldByName('DESCRICAO').asstring      := qryIncons.fieldbyname('DESCRICAO').asstring;        
        qryTmpDesc.FieldByName('VALOR').asfloat           := qryIncons.fieldbyname('VALORESPERADO').asfloat;
        qryTmpDesc.FieldByName('VALORRECEBIDO').asfloat   := qryIncons.fieldbyname('VALORRECEBIDO').asfloat;

        qryTmpDesc.post;

        qryIncons.delete;
     end;
  end;
end;

procedure TfrmGeraContnId.bbtnTodos1Click(Sender: TObject);
begin
  inherited;
  qryTmpDesc.first;

  if not qryTmpDesc.IsEmpty then
  begin
     while not qryTmpDesc.eof do
     begin
        qryIncons.Insert;

        qryIncons.fieldbyname('ANOMESREF').asstring      := qryTmpDesc.FieldByName('MESREFERENCIA').asstring;
        qryIncons.fieldbyname('ANOMESCOB').asstring      := qryTmpDesc.FieldByName('MESCOBRANCA').asstring;
        qryIncons.fieldbyname('TIPOOP').asinteger        := qryTmpDesc.FieldByName('FLGACEITANAOID').asinteger;
        qryIncons.fieldbyname('FLGTIPODESC').asstring    := 'P';
        qryIncons.fieldbyname('IDPESSJUR').asinteger     := qryTmpDesc.FieldByName('IDPESSJUR').asinteger;
        qryIncons.fieldbyname('IDPLANOPREV').asinteger   := qryTmpDesc.FieldByName('IDPLANOPREV').asinteger;
        qryIncons.fieldbyname('IDPESSOA').asinteger      := qryTmpDesc.FieldByName('IDPESSOA').asinteger;
        qryIncons.fieldbyname('SEQPROPOSTA').asinteger   := qryTmpDesc.FieldByName('SEQPROPOSTA').asinteger;
        qryIncons.fieldbyname('MATRICULA').asstring      := qryTmpDesc.FieldByName('MATRICULA').asstring;
        qryIncons.fieldbyname('IDDESCONTO').asinteger    := qryTmpDesc.FieldByName('IDDESCONTO').asinteger;
        qryIncons.fieldbyname('IDPROVENTO').asinteger    := qryTmpDesc.FieldByName('IDPROVENTO').asinteger;
        qryIncons.fieldbyname('DESCRICAO').asstring      := qryTmpDesc.FieldByName('DESCRICAO').asstring;
        qryIncons.fieldbyname('CODPROVDESC').asstring    := qryTmpDesc.FieldByName('CODPROVDESC').asstring;
        qryIncons.fieldbyname('IDMOTIVO').asinteger      := qryTmpDesc.FieldByName('IDMOTIVO').asinteger;
        qryIncons.fieldbyname('VALORESPERADO').asfloat   := qryTmpDesc.FieldByName('VALOR').asfloat;
        qryIncons.fieldbyname('VALORRECEBIDO').asfloat   := qryTmpDesc.FieldByName('VALORRECEBIDO').asfloat;

        qryIncons.Post;

        qryTmpDesc.delete;
     end;
  end;
end;



procedure TfrmGeraContnId.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not qryIncons.IsEmpty then
     qryIncons.cancelupdates;
  if not qryTmpDesc.IsEmpty then
     qryTmpDesc.cancelupdates;
  qryTmpDesc.close;
  qryIncons.close;
  cmbMesRef.SetFocus;
end;



end.