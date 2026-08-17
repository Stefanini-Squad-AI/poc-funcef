unit FCadBenefPeriodo;
// ARRUMAR BOTOES - ATUALIZA BOTOES

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, DBCtrls, Mask, wwdbedit, wwdbdatetimepicker,
  CMDateTimePicker, StdCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  CMDBLookupCombo, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBTables, Wwquery,ppModule;
const
   CSQL = 'SELECT * FROM MANUTBENEFPERIODO MANU, PESSOA PE WHERE ';

type
  TfrmCadBenefPeriodo = class(TFrmCadastroMT)
    dbGrd: TwwDBGrid;
    pnlCampos: TPanel;
    lblDataCotacao: TLabel;
    lblValorCotacao: TLabel;
    lblRefer: TLabel;
    LbldataFin: TLabel;
    Label3: TLabel;
    DbDataInicio: TCMDateTimePicker;
    DbDataFim: TCMDateTimePicker;
    EdtValorBenef: TDBRealEdit;
    edtFornecedor: TwwDBEdit;
    pnlObservacao: TPanel;
    Label1: TLabel;
    DBMOBSERVACAO: TDBMemo;
    Label2: TLabel;
    EdtValorParticipacao: TDBRealEdit;
    lblBeneficio: TLabel;
    CdsFornecedor: TCMClientDataSet;
    dsFornecedor: TwwDataSource;
    MontaSelectFornecedor: TMontaSelect;
    SpeedButton1: TSpeedButton;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Insert;
    procedure Carregar;
    procedure Update;
    procedure Delete;
    procedure AtualizaBotao;
    { Public declarations }
  end;

var
  frmCadBenefPeriodo: TfrmCadBenefPeriodo;
  sIdBeneficio,sIdFornecedor, sIdBenefFunc, sSeqBenef : string;

implementation

{$R *.DFM}
uses uMensErro, dBasedados, uSistema, uMidasUtil,uCtrlPadroes,UDataBase,uAutorizacao;

procedure TfrmCadBenefPeriodo.bbtnConfirmarClick(Sender: TObject);
begin
  if (DbDataInicio.Text = '')then begin
    MsgDlg( 'Informe a Data Início', 'Aviso', MtInformation, [MbOk], 0 );
    Exit;
  end;
  if (DbDataInicio.Date > DbDataFim.Date) and (DbDataFim.Text <> '')then begin
    MsgDlg( 'A Data Fim deve ser maior que a Data Início', 'Aviso', MtInformation, [MbOk], 0 );
    Exit;
  end;
  if (edtFornecedor.Text='')then begin
    MsgDlg( 'Informe o Fornecedor', 'Aviso', MtInformation, [MbOk], 0 );
    Exit;
  end;

  if  Cds.state in [DsInsert] then
    Insert
  else if  Cds.state in [DsEdit] then
    Update;
  //inherited;

  bbtnCancelarClick(sender);
  bbtnConfirmar.Enabled := False;
  {bbtnCancelar.Enabled  := False;
  sbtnInserir.Enabled   := False;
  sbtnAlterar.Enabled   := False;
  sbtnApagar.Enabled    := False;}
  sbtnProcurar.Enabled  := True;
  pnlCampos.Enabled := False;
  pnlObservacao.Enabled := pnlCampos.Enabled;
  //MontaSelect.Cancela;
  //MontaSelectFornecedor.Cancela;
  Carregar;
  dbGrd.Enabled := True;

end;

procedure TfrmCadBenefPeriodo.sbtnProcurarClick(Sender: TObject);
var
  sSQL : string;
begin
  sbtnInserir.Enabled := False;
  MontaSelect.Executar;
  If MontaSelect.RetornouValor Then begin
      sSQL := CSQL;
      if MontaSelect.ValoresChave[0] <> '' then
         lblBeneficio.Caption :=  MontaSelect.ValoresChave[0]
      else
         lblBeneficio.Caption :=  '';

      if MontaSelect.ValoresChave[1] = '' then
         sIdBeneficio         := '0'
      else
         sIdBeneficio         :=  MontaSelect.ValoresChave[1];

      if MontaSelect.ValoresChave[2] = '' then
         sIdFornecedor         := '0'
      else begin
         sIdFornecedor      :=  MontaSelect.ValoresChave[2];
         edtFornecedor.Text :=  MontaSelect.ValoresChave[3];
      end;
      sIdBenefFunc :=  MontaSelect.ValoresChave[4];
      sSQL := sSQL + ' MANU.IDBENEFPER = ' + sIdBeneficio;
      //sSQL := sSQL + ' AND MANU.IDPESSOA = ' + sIdFornecedor;
      sSQL := sSQL + ' AND PE.IDPESSOA = MANU.IDPESSOA ';

      Cds.Data             :=  Padroes.GetDataPacket(sSQL);
      if Cds.IsEmpty then begin
        sbtnAlterar.Enabled := False;
        sbtnApagar.Enabled := False;
      end else begin
        sbtnAlterar.Enabled := True;
        sbtnApagar.Enabled := True;
      end;
      sbtnInserir.Enabled := True;
      cds.Edit;
  end
  else begin
    sbtnInserir.Enabled := False;
    sbtnAlterar.Enabled := False;
    sbtnApagar.Enabled := False;
  end;

end;

procedure TfrmCadBenefPeriodo.FormCreate(Sender: TObject);
  var sSQL : string;
begin
  //inherited;
  lblBeneficio.Caption := '';
  sIdBeneficio  := '0';
  sIdFornecedor := '0';
  //Carregar;
  sbtnInserir.Enabled := False;
  sbtnAlterar.Enabled := False;
  sbtnApagar.Enabled := False;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;    

  sSQL := CSQL;
  sSQL := sSQL + ' MANU.IDBENEFPER = ' + sIdBeneficio;
  //sSQL := sSQL + ' AND MANU.IDPESSOA = ' + sIdFornecedor;
  sSQL := sSQL + ' AND PE.IDPESSOA = MANU.IDPESSOA ';
  Cds.Data             :=  Padroes.GetDataPacket(sSQL);

end;

procedure TfrmCadBenefPeriodo.Insert;
var sSQL,svalorEmpregado,sValorBenef : string;
    qryInset :TwwQuery;
begin
   qryInset := TwwQuery.create(Application);
   qryInset.DataBaseName := 'BaseDados';
   StartTransacao;
   try
     qryInset.Close;
     qryInset.SQL.Text := ' SELECT MAX(IDBENEFSALFUNC) IDBENEFSALFUNC '+
                          ' FROM MANUTBENEFPERIODO WHERE IDBENEFPER ='+sIdBeneficio;

     qryInset.Open;
     svalorEmpregado:= StringReplace(EdtValorBenef.Text,'.','', [rfReplaceAll]);
     sValorBenef:=  StringReplace(EdtValorParticipacao.Text,'.','', [rfReplaceAll]);

     svalorEmpregado:= StringReplace(Trim(svalorEmpregado),',','.', [rfReplaceAll]);
     sValorBenef:=  StringReplace(Trim(sValorBenef),',','.', [rfReplaceAll]);

     sSQL := '   INSERT INTO MANUTBENEFPERIODO(         '+
             '        IDBENEFSALFUNC,  '+
             '         IDBENEFPER,    '+
             '         IDPESSOA,       '+
             '         DATAINICIO,     '+
             '         DATAFIM,        '+
             '         VLBENEFICIO,    '+
             '         VLPARTICIPACAO, '+
             '         OBSERVACAO      '+
             ' ) VALUES(               '+
                       IntToStr(qryInset.FieldByName('IDBENEFSALFUNC').AsInteger +1)+','+
                       sIdBeneficio                       +','+
                       sIdFornecedor                      +','+
                       QuotedStr(DbDataInicio.Text)       +','+
                       QuotedStr(DbDataFim.Text)          +','+
                       sValorBenef                        +','+
                       svalorEmpregado                    +','+
                       QuotedStr(DBMOBSERVACAO.Lines.Text)+')';

      qryInset.close;
      qryInset.SQL.Text := sSQL;
      qryInset.Prepare;
      qryInset.ExecSQL;

      CommitTransacao;
   except
        RollBackTransacao;
        MsgDlg( 'Ocorreu um erro ao gravação, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
        qryInset.Destroy;
        Exit;
   end;
   qryInset.Destroy;
end;

procedure TfrmCadBenefPeriodo.Carregar;
var sSQL : string;
begin
  if sIdBeneficio = '' then
     sIdBeneficio := '0';
  sSQL := CSQL;
  sSQL := sSQL + ' MANU.IDBENEFPER = ' + sIdBeneficio;
  //sSQL := sSQL + ' AND MANU.IDPESSOA = ' + sIdFornecedor;
  sSQL := sSQL + ' AND PE.IDPESSOA = MANU.IDPESSOA ';
  Cds.Data             :=  Padroes.GetDataPacket(sSQL);

  edtFornecedor.Text := Cds.FieldByName('NOME').AsString;
  sIdFornecedor      := Cds.FieldByName('IDPESSOA').AsString;
  sSeqBenef       := Cds.FieldByName('IDBENEFSALFUNC').AsString;
  sIdBeneficio       := Cds.FieldByName('IDBENEFPER').AsString;
  if not Cds.IsEmpty then
     Cds.Edit
  else begin
     Cds.Cancel;
     CdsFornecedor.Cancel;
  end;

  pnlFundo.Enabled := true;

  if Cds.IsEmpty then  begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := False;
    sbtnApagar.Enabled  := False;
  end
  else
  begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := True;
    sbtnApagar.Enabled  := True;
  end;

end;

procedure TfrmCadBenefPeriodo.Button1Click(Sender: TObject);
begin
  MontaSelectFornecedor.Executar;
  if MontaSelectFornecedor.RetornouValor then begin
    sIdFornecedor  := MontaSelectFornecedor.ValoresChave[0];
    edtFornecedor.Text := MontaSelectFornecedor.ValoresChave[1];

  end;
end;

procedure TfrmCadBenefPeriodo.FormShow(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadBenefPeriodo.Update;
var  qryUpdate : TwwQuery;
sValorBenef,svalorEmpregado:string;
begin
   qryUpdate := TwwQuery.create(Application);
   qryUpdate.DataBaseName := 'BaseDados';

   svalorEmpregado:=  StringReplace(EdtValorBenef.Text,'.','', [rfReplaceAll]);
   sValorBenef    :=  StringReplace(EdtValorParticipacao.Text,'.','', [rfReplaceAll]);

   svalorEmpregado:=  StringReplace(Trim(svalorEmpregado),',','.', [rfReplaceAll]);
   sValorBenef    :=  StringReplace(Trim(sValorBenef),',','.', [rfReplaceAll]);

   StartTransacao;
   try
        qryUpdate.SQL.Text := (
        'UPDATE MANUTBENEFPERIODO SET  '+
        '	IDPESSOA        =            '+  sIdFornecedor +
        ',	DATAINICIO      =            '+  QuotedStr(DbDataInicio.Text)+
        ',	DATAFIM         =            '+  QuotedStr(DbDataFim.Text)+
        ',	VLBENEFICIO     =            '+  svalorEmpregado+
        ',	VLPARTICIPACAO  =            '+  sValorBenef+
        ',	OBSERVACAO      =            '+  QuotedStr(DBMOBSERVACAO.Lines.Text)+
        ' WHERE      IDBENEFPER = '+sIdBeneficio+
        '       AND  IDBENEFSALFUNC = '+sSeqBenef);


        qryUpdate.ExecSQL;
        CommitTransacao;
   except
        RollBackTransacao;
        MsgDlg( 'Ocorreu um erro ao atualização, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
        qryUpdate.Destroy;
        Exit;
   end;
   qryUpdate.Destroy;
end;

procedure TfrmCadBenefPeriodo.AtualizaBotao;
begin
   {  bbtnConfirmar.Enabled :=
     bbtnCancelar.Enabled  :=

     //if Cds.State = [cdEdit] then
          sbtnInserir.Enabled :=
          sbtnAlterar.Enabled :=
          sbtnApagar.Enabled  :=
                     }
end;

procedure TfrmCadBenefPeriodo.Delete;
var  qryDelete:TwwQuery;
begin
  inherited;
   qryDelete := TwwQuery.create(Application);
   qryDelete.DataBaseName := 'BaseDados';
   StartTransacao;
   try
        qryDelete.SQL.Text :='DELETE FROM MANUTBENEFPERIODO WHERE IDBENEFSALFUNC = '+ sSeqBenef +' AND IDBENEFPER ='+sIdBeneficio;
        qryDelete.ExecSQL;
        CommitTransacao;
   except
        RollBackTransacao;
        MsgDlg( 'Ocorreu um erro ao deletar, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
        qryDelete.Destroy;
        Exit;
   end;
   qryDelete.Destroy;
end;

procedure TfrmCadBenefPeriodo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
//  sbtnInserir.Enabled := False;
  Carregar;
  dbGrd.Enabled := True;
end;

procedure TfrmCadBenefPeriodo.sbtnApagarClick(Sender: TObject);
begin
  //inherited;
  if (MsgDlg( 'Deseja realmente excluir?', 'Aviso', MtInformation, [MbYes,mbno], 0) = mrYes) then begin
    sSeqBenef := Cds.FieldByName('IDBENEFSALFUNC').asString;
    edtFornecedor.Text := Cds.FieldByName('NOME').AsString;
    sIdFornecedor := Cds.FieldByName('IDPESSOA').AsString;
    Delete;
    Carregar;
  end;
end;


procedure TfrmCadBenefPeriodo.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled := True;
  pnlCampos.Enabled :=  True;
  pnlObservacao.Enabled := pnlCampos.Enabled;
  sSeqBenef := Cds.FieldByName('IDBENEFSALFUNC').asString;
  edtFornecedor.Text := Cds.FieldByName('NOME').AsString;
  sIdFornecedor := Cds.FieldByName('IDPESSOA').AsString;
  dbGrd.Enabled:= False;
  //Carregar;
end;

procedure TfrmCadBenefPeriodo.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if  Cds.FieldByName('IDBENEFPER').AsString <> '' then
    sIdBeneficio       := Cds.FieldByName('IDBENEFPER').AsString;
  sSeqBenef := Cds.FieldByName('IDBENEFSALFUNC').asString;
  edtFornecedor.Text := Cds.FieldByName('NOME').AsString;
  sIdFornecedor := Cds.FieldByName('IDPESSOA').AsString;

end;

procedure TfrmCadBenefPeriodo.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := true;
  bbtnCancelar.Enabled := True;
  pnlCampos.Enabled := true;
  pnlObservacao.Enabled := pnlCampos.Enabled;
end;

procedure TfrmCadBenefPeriodo.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MontaSelectFornecedor.Executar;
  if MontaSelectFornecedor.RetornouValor then begin
    sIdFornecedor  := MontaSelectFornecedor.ValoresChave[0];
    edtFornecedor.Text := MontaSelectFornecedor.ValoresChave[1];

  end;
end;

procedure TfrmCadBenefPeriodo.bbtnSairClick(Sender: TObject);
begin
  //Cds.Close;
  //CdsFornecedor.Close;
 // bbtnCancelarClick(Self);
  inherited;
end;

end.
