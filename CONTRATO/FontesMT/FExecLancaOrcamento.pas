{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27582
Responsável : Daniel Simões
Data        : 12/03/2008
Descrição   : Ajuste do Help Context.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecLancaOrcamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, Db, uCmSqlParams, uCtrlPadroes,
  DBClient, uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, uCtrlContrRateioOrc,
  DBCtrls, DBCGrids;

type
  TfrmExecLancaOrcamento = class(TfrmOkCancelar)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    dbSpnAno: TwwDBSpinEdit;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    dbgContratos: TwwDBGrid;
    cdsLancaOrc: TCMClientDataSet;
    cdsContratos: TCMClientDataSet;
    sqlItens: TCMSqlParams;
    sqlContratos: TCMSqlParams;
    cdsItens: TCMClientDataSet;
    dsContratos: TDataSource;
    dsItens: TDataSource;
    btnIntegra: TBitBtn;
    sqlValorItem: TCMSqlParams;
    dsValorItem: TDataSource;
    cdsValorItem: TCMClientDataSet;
    wwDBGrid1: TwwDBGrid;
    DBCtrlGrid1: TDBCtrlGrid;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    procedure dbSpnAnoExit(Sender: TObject);
    procedure FiltraRegistro(Dataset : TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIntegraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsItensAfterScroll(DataSet: TDataSet);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoRateioOrc : TCtrlContratoRateioOrc;
    function VerificaAtualizacoesPendentes : Boolean;

  public
    { Public declarations }
  end;

var
  frmExecLancaOrcamento: TfrmExecLancaOrcamento;

implementation
uses dBaseDados, uSistema, uMensErro;                                                                  

{$R *.DFM}



procedure TfrmExecLancaOrcamento.dbSpnAnoExit(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   if TBitBtn(Sender).Name = 'bbtnCancelar' then
      if VerificaAtualizacoesPendentes then
         if MsgDlg('Existem atualizações pendentes de gravação. Deseja prosseguir?',Sistema.NomeModulo,mtConfirmation,[mbYes,mbNo],0) = mrNo then
            Exit;

   If cdsContratos.Active then cdsContratos.Close;
   If cdsItens.Active then
   begin
      cdsItens.Filtered := false;
      cdsItens.Close;
   end;

   cdsItens.Data     := CtrlContratoRateioOrc.LookupItensContrato(StrToInt(dbSpnAno.text));
   cdsValorItem.Data := CtrlContratoRateioOrc.LookupContratoRateioOrc(StrToInt(dbSpnAno.text));
   cdsLancaOrc.Data  := CtrlContratoRateioOrc.LookupRateiosLancados(StrToInt(dbSpnAno.text));

   for i := 0 to cdsValorItem.FieldCount -1 do
   begin
      if TField(cdsValorItem.Fields[i]) is TFloatField then
      begin
         if TField(cdsValorItem.Fields[i]).FieldName <> 'MES' then
         begin
            TFloatField(cdsValorItem.Fields[i]).EditFormat    := ',0.00';
            TFloatField(cdsValorItem.Fields[i]).DisplayFormat := ',0.00';
         end;
      end;

   end;

   cdsItens.First;
   cdsContratos.AfterScroll := Nil;
   sqlContratos.Open;

   while not cdsItens.Eof do begin
      If not cdsContratos.Locate('IDCONTRATO', cdsItens.FieldByName('IDCONTRATO').AsString,[]) then
      begin
         cdsContratos.Insert;
         cdsContratos.FieldByname('IDCONTRATO').AsInteger     := cdsItens.FieldByName('IDCONTRATO').AsInteger;
         cdsContratos.FieldByname('NOMECONTRATO').AsString    := cdsItens.FieldByName('NOMECONTRATO').AsString;
         cdsContratos.FieldByname('CODCONTRATOEMPR').AsString := cdsItens.FieldByName('CODCONTRATOEMPR').AsString;
         cdsContratos.Post;
      end;
      cdsItens.Next;
   end;

   cdsItens.First;
   cdsContratos.AfterScroll := FiltraRegistro;
   cdsContratos.First;

end;



procedure TfrmExecLancaOrcamento.FiltraRegistro(Dataset: TDataSet);
begin
   if not cdsContratos.FieldByName('IDCONTRATO').IsNull then
   begin
     cdsItens.Filtered := false;
     cdsItens.Filter   := 'idcontrato = ' + cdsContratos.FieldByName('IDCONTRATO').AsString;
     cdsItens.Filtered := true;
   end;
end;



procedure TfrmExecLancaOrcamento.bbtnConfirmarClick(Sender: TObject);
var
   iIdRateioCusto, iAno : Integer;
begin
   inherited;
   cdsValorItem.Filtered := False;
   cdsValorItem.first;
   while not cdsValorItem.eof do begin

      // Grava o valor apurado
      if not cdsLancaOrc.Locate('IDCONTRATO;IDOBJETO;IDITEM;ANO;MES',
                                VarArrayOf([cdsValorItem.FieldByName('IDCONTRATO').AsInteger,
                                            cdsValorItem.FieldByName('IDOBJETO').AsInteger,
                                            cdsValorItem.FieldByName('IDITEM').AsInteger,
                                            StrToInt(dbSpnAno.text),
                                            cdsValorItem.FieldByName('MES').AsInteger]),
                                []) then
      begin
         cdsLancaOrc.Insert;
         cdsLancaOrc.FieldByName('IDCONTRATO').AsInteger     := cdsValorItem.FieldByName('IDCONTRATO').AsInteger;
         cdsLancaOrc.FieldByName('IDOBJETO').AsInteger       := cdsValorItem.FieldByName('IDOBJETO').AsInteger;
         cdsLancaOrc.FieldByName('IDITEM').AsInteger         := cdsValorItem.FieldByName('IDITEM').AsInteger;
         cdsLancaOrc.FieldByName('ANO').AsInteger            := StrToInt(dbSpnAno.text);
         cdsLancaOrc.FieldByName('MES').AsInteger            := cdsValorItem.FieldByName('MES').AsInteger;
      end
      else
         cdsLancaOrc.Edit;

      cdsLancaOrc.FieldByName('VALOR').AsFloat := cdsValorItem.FieldByName('VALOR').AsFloat;
      cdsLancaOrc.FieldByName('QTDE').AsFloat  := cdsValorItem.FieldByName('QTDE').AsFloat;

      cdsLancaOrc.Post;
      cdsValorItem.Next;
   end;
   CtrlContratoRateioOrc.GravaContratoRateioOrc;
   dbSpnAnoExit(Sender);
end;



procedure TfrmExecLancaOrcamento.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlContratoRateioOrc := TCtrlContratoRateioOrc.Create;
   CtrlContratoRateioOrc.InitializeAs(Padroes);
   CtrlContratoRateioOrc.CdsContrRateioOrc := cdsLancaOrc;

   dbSpnAno.Text := FormatDatetime('yyyy',date);
   dbSpnAnoExit(Sender);
end;



procedure TfrmExecLancaOrcamento.btnIntegraClick(Sender: TObject);
begin
   inherited;
   if MsgDlg('Confirma efetuar integração orçamentária?',Sistema.NomeModulo,mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;

   if VerificaAtualizacoesPendentes then
      if MsgDlg('Existem atualizações pendentes de gravação. Deseja prosseguir?',Sistema.NomeModulo,mtConfirmation,[mbYes,mbNo],0) = mrNo then
         Exit;

   if not CtrlContratoRateioOrc.IntegraOrcamento(Trunc(dbSpnAno.Value)) then
      MsgDlg(CtrlContratoRateioOrc.MessageInfo,Sistema.NomeModulo,mtError,[mbOK],0)
   else
      MsgDlg(CtrlContratoRateioOrc.MessageInfo,Sistema.NomeModulo,mtInformation,[mbOK],0);

   cdsLancaOrc.Data  := CtrlContratoRateioOrc.LookupRateiosLancados(StrToInt(dbSpnAno.text));
end;



procedure TfrmExecLancaOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if VerificaAtualizacoesPendentes then
      if MsgDlg('Existem atualizações pendentes de gravação. Deseja prosseguir?',Sistema.NomeModulo,mtConfirmation,[mbYes,mbNo],0) = mrNo then
         Exit;

   FreeAndNil(CtrlContratoRateioOrc);
   inherited;
end;



procedure TfrmExecLancaOrcamento.cdsItensAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if not cdsItens.FieldByName('IDCONTRATO').IsNull then
   begin
     cdsValorItem.Filtered := false;
     cdsValorItem.Filter   := 'idcontrato = ' + cdsItens.FieldByName('IDCONTRATO').AsString +
                              ' and idobjeto = ' + cdsItens.FieldByName('IDOBJETO').AsString +
                              ' and iditem = ' + cdsItens.FieldByName('IDITEM').AsString;
     cdsValorItem.Filtered := true;
   end;
end;


procedure TfrmExecLancaOrcamento.DBEdit2Exit(Sender: TObject);
begin
   inherited;
   if cdsValorItem.State = dsBrowse then cdsValorItem.Edit; 
   cdsValorItem.FieldByName('TOTAL').AsFloat := cdsValorItem.FieldByName('VALOR').AsFloat * cdsValorItem.FieldByName('QTDE').AsFloat;
end;



function TfrmExecLancaOrcamento.VerificaAtualizacoesPendentes: Boolean;
begin
   Result := (cdsValorItem.Active) and (cdsValorItem.ChangeCount > 0);
end;

end.
