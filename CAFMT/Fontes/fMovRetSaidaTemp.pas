unit fMovRetSaidaTemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  Wwdbigrd, Wwdatsrc, Grids, Wwdbgrid, MontaSelect, Mask, wwdbedit, DBCtrls,
  TB97Ctls, fcLabel, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmMovRetSaidaTemp = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    Label1: TLabel;
    dbgBensTermo: TwwDBGrid;
    Termo: TLabel;
    dbeTermo: TwwDBEdit;
    MSTermo: TMontaSelect;
    qrySelTermo: TwwQuery;
    dsSelTermo: TwwDataSource;
    qrySelTermoIDSAIDATEMPORARIA: TFloatField;
    qrySelTermoSTPTERMO: TFloatField;
    qrySelTermoSTPDATA: TDateTimeField;
    qrySelTermoDESCTIPSAITEMP: TStringField;
    qrySelTermoDESCLOCAL: TStringField;
    qrySelTermoNOMERESP: TStringField;
    qrySelTermoSTPOBSERVACOES: TStringField;
    qrySelTermoBens: TwwQuery;
    dsSelTermoBens: TwwDataSource;
    qrySelTermoBensIDSAIDATEMPORARIA: TFloatField;
    qrySelTermoBensPLACA: TFloatField;
    qrySelTermoBensDESBEM: TStringField;
    qryUpdBem: TwwQuery;
    qryUpdTermoSaida: TwwQuery;
    qrySelTermoBensIDPESSOA: TFloatField;
    qrySelTermoBensIDBEM: TFloatField;
    qrySelTermoSTPFLGEXEC: TFloatField;
    Label3: TLabel;
    Label34: TLabel;
    dbeLocalizacao: TwwDBEdit;
    Label4: TLabel;
    dbeResponsavel: TwwDBEdit;
    Label2: TLabel;
    dbeMotivo: TwwDBEdit;
    Label6: TLabel;
    dbeObs: TDBMemo;
    pnlData: TPanel;
    dbeData: TCMDateTimePicker;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnSelTermo: TToolbarButton97;
    bbtnSelTermoBem: TToolbarButton97;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    bbtnRegRetorno: TToolbarButton97;
    qryUpdTermoSaidaBens: TwwQuery;
    Toolbar973: TToolbar97;
    edDataRetorno: TCMDateTimePicker;
    fcLabel1: TfcLabel;
    updSelTermoBens: TUpdateSQL;
    qrySelTermoBensMARCADO: TFloatField;
    qrySelTermoBensSTBDATARETORNO: TDateTimeField;
    qrySelBemTermo: TwwQuery;
    qrySelBemTermoIDSAIDATEMPORARIA: TFloatField;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTermoClick(Sender: TObject);
    procedure bbtnSelTermoBemClick(Sender: TObject);
    procedure bbtnRegRetornoClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LimpaCampos;
    { Public declarations }
  end;

var
  frmMovRetSaidaTemp: TfrmMovRetSaidaTemp;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, uDataBase, dBaseDados,
  dAtivoFixo;

{$R *.DFM}

//========================================================================================
procedure TfrmMovRetSaidaTemp.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   inherited;
   Screen.Cursor := crHourGlass;
   qrySelTermo.Prepare;
   qrySelTermoBens.Prepare;
   qrySelBemTermo.Prepare;
   qryUpdTermoSaida.Prepare;
   qryUpdTermoSaidaBens.Prepare;
   qryUpdBem.Prepare;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   edDataRetorno.Date    := Date;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovRetSaidaTemp.bbtnSelTermoBemClick(Sender: TObject);
begin
   inherited;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crSQLWait;
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBemTermo.Close;
      qrySelBemTermo.ParamByName('PIDPESSOA').AsString := dtmAtivoFixo.MSBem.ValoresChave[0];
      qrySelBemTermo.ParamByName('PIDBEM').AsString    := dtmAtivoFixo.MSBem.ValoresChave[1];
      qrySelBemTermo.Open;
      //----------------------------------------------------------------------------------
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PIDSAIDATEMP').AsInteger := qrySelBemTermoIDSAIDATEMPORARIA.AsInteger;
      qrySelTermo.Open;
      qrySelTermoBens.Close;
      qrySelTermoBens.ParamByName('PIDSAIDATEMP').AsInteger := qrySelBemTermoIDSAIDATEMPORARIA.AsInteger;
      qrySelTermoBens.Open;
      //----------------------------------------------------------------------------------
      if (qrySelTermoSTPFLGEXEC.AsInteger = 0) then
      begin
         MsgDlg('Termo de Saída Temporária não executado','Erro',mtError,[mbOK],0);
         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled  := True;
      end else
      begin
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
      end;
      pnlDetalhe.Enabled  := True;
      qrySelTermoBens.Locate('IDBEM',strtoint(dtmAtivoFixo.MSBem.ValoresChave[1]),[]);
      dbgBensTermo.SetFocus;
   end else
      LimpaCampos;
end;
//========================================================================================
procedure TfrmMovRetSaidaTemp.bbtnSelTermoClick(Sender: TObject);
begin
   inherited;
   MSTermo.Executar;
   //-------------------------------------------------------------------------------------
   frmMovRetSaidaTemp.Invalidate;
   frmMovRetSaidaTemp.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSTermo.ValoresChave.Count > 0) and (MSTermo.ValoresChave[0] <> '') then
   begin
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PIDSAIDATEMP').AsInteger := StrToInt(MSTermo.ValoresChave[0]);
      qrySelTermo.Open;
      qrySelTermoBens.Close;
      qrySelTermoBens.ParamByName('PIDSAIDATEMP').AsInteger := StrToInt(MSTermo.ValoresChave[0]);
      qrySelTermoBens.Open;
      //----------------------------------------------------------------------------------
      if (qrySelTermoSTPFLGEXEC.AsInteger = 0) then
      begin
         MsgDlg('Termo de Saída Temporária não executado','Erro',mtError,[mbOK],0);
         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled  := True;
      end else
      begin
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
      end;
      pnlDetalhe.Enabled  := True;
      dbgBensTermo.SetFocus;
   end else
      LimpaCampos;
end;
//========================================================================================
procedure TfrmMovRetSaidaTemp.LimpaCampos;
begin
   qrySelTermoBens.Close;
   qrySelTermo.Close;
   ToolBar971.SetFocus;
end;
//========================================================================================
procedure TfrmMovRetSaidaTemp.bbtnRegRetornoClick(Sender: TObject);
begin
   inherited;
   if (qrySelTermoBensMARCADO.AsInteger = 0) and (edDataRetorno.Text = '') then
   begin
      MsgDlg('Informe a data de retorno do bem!','Erro',mtError,[mbOK],0);
      edDataRetorno.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   qrySelTermoBens.Edit;
   if (qrySelTermoBensMARCADO.AsInteger = 0) then
   begin
      qrySelTermoBensMARCADO.AsInteger         := 1;
      qrySelTermoBensSTBDATARETORNO.AsDateTime := edDataRetorno.Date;
   end else
   begin
      qrySelTermoBensMARCADO.AsInteger       := 0;
      qrySelTermoBensSTBDATARETORNO.Clear;
   end;
end;
//========================================================================================
procedure TfrmMovRetSaidaTemp.bbtnConfirmarClick(Sender: TObject);
var
   bTransacao   : Boolean;
   iQtdBensFora : Integer;
   dDataUltimo  : tDateTime;
   
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Screen.Cursor := crSQLWait;
   if not (dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      qrySelTermoBens.First;
      while not qrySelTermoBens.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Seta/Reseta o Flag de Saída Temporária na Tabela BEM
         //-------------------------------------------------------------------------------
         qryUpdBem.ParamByName('PIDBEM').AsInteger        := qrySelTermoBensIDBEM.AsInteger;
         qryUpdBem.ParamByName('PIDPESSOA').AsInteger     := qrySelTermoBensIDPESSOA.AsInteger;
         if (qrySelTermoBensMARCADO.AsInteger = 1) then
            qryUpdBem.ParamByName('PFLGSAIDATEMP').AsInteger := 0
         else
            qryUpdBem.ParamByName('PFLGSAIDATEMP').AsInteger := 1;
         qryUpdBem.ExecSQL;
         //-------------------------------------------------------------------------------
         // Seta/Reseta o Flag de Saída Temporária na Tabela SAIDATEMPBENS
         //-------------------------------------------------------------------------------
         qryUpdTermoSaidaBens.ParamByName('PIDSAIDATEMP').AsInteger := qrySelTermoBensIDSAIDATEMPORARIA.AsInteger;
         qryUpdTermoSaidaBens.ParamByName('PIDBEM').AsInteger    := qrySelTermoBensIDBEM.AsInteger;
         qryUpdTermoSaidaBens.ParamByName('PIDPESSOA').AsInteger := qrySelTermoBensIDPESSOA.AsInteger;
         if (qrySelTermoBensSTBDATARETORNO.IsNull) then
            qryUpdTermoSaidaBens.ParamByName('PDATA').Clear
         else
            qryUpdTermoSaidaBens.ParamByName('PDATA').AsDateTime := qrySelTermoBensSTBDATARETORNO.AsDateTime;
         qryUpdTermoSaidaBens.ExecSQL;
         //-------------------------------------------------------------------------------
         qrySelTermoBens.Next;
      end;
      //----------------------------------------------------------------------------------
      // Se Todos os Bens de um Termo ja retornaram, registre a data do ultimo retorno
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT COUNT(IDSAIDATEMPORARIA) AS QTDBENSFORA '+
                         ' FROM SAIDATEMPBENS '+
                         ' WHERE (STBDATARETORNO IS NULL) '+
                         '   AND (IDSAIDATEMPORARIA = ' + qrySelTermoIDSAIDATEMPORARIA.AsString + ')';
      qryAux.Open;
      iQtdBensFora := qryAux.FieldByName('QTDBENSFORA').AsInteger;
      //----------------------------------------------------------------------------------
      if iQtdBensFora = 0 then
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT MAX(STBDATARETORNO) AS DATAULTIMO '+
                            ' FROM SAIDATEMPBENS '+
                            ' WHERE (IDSAIDATEMPORARIA = ' + qrySelTermoIDSAIDATEMPORARIA.AsString + ')';
         qryAux.Open;
         dDataUltimo := qryAux.FieldByName('DATAULTIMO').AsDateTime;
         //----------------------------------------------------------------------------------
         qryUpdTermoSaida.ParamByName('PIDSAIDATEMP').AsInteger := qrySelTermoIDSAIDATEMPORARIA.AsInteger;
         qryUpdTermoSaida.ParamByName('PDATA').AsDateTime       := dDataUltimo;
         qryUpdTermoSaida.ExecSQL;
      end else
      begin
         qryUpdTermoSaida.ParamByName('PIDSAIDATEMP').AsInteger := qrySelTermoIDSAIDATEMPORARIA.AsInteger;
         qryUpdTermoSaida.ParamByName('PDATA').Clear;
         qryUpdTermoSaida.ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      qrySelTermoBens.CancelUpdates;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Retorno de Bens do Termo de Saida Temporária') then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Screen.Cursor := crDefault;
      MsgDlg('Retorno de Bens do Termo de Saida Temporária Registrado!','Informação',mtInformation,[mbOk],0);
   except
      if bTransacao then
         RollBackTransacao;
      Screen.Cursor := crDefault;
      MsgDlg('Retorno de Bens do Termo de Saida Temporária não registrado!','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMovRetSaidaTemp.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;
//========================================================================================
procedure TfrmMovRetSaidaTemp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelTermo.Close;
   qrySelTermoBens.Close;
   qrySelBemTermo.Close;
   //-------------------------------------------------------------------------------------
   qrySelTermo.UnPrepare;
   qrySelTermoBens.UnPrepare;
   qrySelBemTermo.UnPrepare;
   qryUpdTermoSaida.UnPrepare;
   qryUpdTermoSaidaBens.UnPrepare;
   qryUpdBem.UnPrepare;
end;

end.
