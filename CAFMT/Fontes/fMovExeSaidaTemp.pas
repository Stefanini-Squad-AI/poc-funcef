unit fMovExeSaidaTemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  Wwdbigrd, Wwdatsrc, Grids, Wwdbgrid, MontaSelect, Mask, wwdbedit, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmMovExeSaidaTemp = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    Label1: TLabel;
    dbgBensConj: TwwDBGrid;
    Termo: TLabel;
    dbeTermo: TwwDBEdit;
    Label4: TLabel;
    dbeResponsavel: TwwDBEdit;
    Label34: TLabel;
    dbeLocalizacao: TwwDBEdit;
    Label6: TLabel;
    dbeObs: TDBMemo;
    bbtnSelTermo: TBitBtn;
    MSTermo: TMontaSelect;
    dbeMotivo: TwwDBEdit;
    Label2: TLabel;
    qrySelTermo: TwwQuery;
    dsSelTermo: TwwDataSource;
    qrySelTermoIDSAIDATEMPORARIA: TFloatField;
    qrySelTermoSTPTERMO: TFloatField;
    qrySelTermoSTPDATA: TDateTimeField;
    qrySelTermoDESCTIPSAITEMP: TStringField;
    qrySelTermoDESCLOCAL: TStringField;
    qrySelTermoNOMERESP: TStringField;
    qrySelTermoSTPOBSERVACOES: TStringField;
    Label5: TLabel;
    qrySelTermoBens: TwwQuery;
    dsSelTermoBens: TwwDataSource;
    qrySelTermoBensIDSAIDATEMPORARIA: TFloatField;
    qrySelTermoBensPLACA: TFloatField;
    qrySelTermoBensDESBEM: TStringField;
    Bevel3: TBevel;
    qryUpdBem: TwwQuery;
    qryUpdTermoSaida: TwwQuery;
    qrySelTermoBensIDPESSOA: TFloatField;
    qrySelTermoBensIDBEM: TFloatField;
    qrySelTermoSTPFLGEXEC: TFloatField;
    Label3: TLabel;
    pnlData: TPanel;
    edData: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTermoClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LimpaCampos;
    { Public declarations }
  end;

var
  frmMovExeSaidaTemp: TfrmMovExeSaidaTemp;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, uDataBase, dBaseDados;

{$R *.DFM}

//========================================================================================
procedure TfrmMovExeSaidaTemp.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   inherited;
   Screen.Cursor := crHourGlass;
   qrySelTermo.Prepare;
   qrySelTermoBens.Prepare;
   qryUpdTermoSaida.Prepare;
   qryUpdBem.Prepare;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovExeSaidaTemp.bbtnSelTermoClick(Sender: TObject);
begin
   inherited;
   MSTermo.Executar;
   //-------------------------------------------------------------------------------------
   frmMovExeSaidaTemp.Invalidate;
   frmMovExeSaidaTemp.Repaint;
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
      edData.Date := qrySelTermoSTPDATA.AsDateTime;
      if (qrySelTermoSTPFLGEXEC.AsInteger = 1) then
      begin
         MsgDlg('Termo de Saída Temporária já executado','Erro',mtError,[mbOK],0);
         pnlData.Enabled := False;
         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled  := True;
      end else
      begin
         pnlData.Enabled := True;
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
      end;
      pnlDetalhe.Enabled  := True;
   end else
      LimpaCampos;
end;
//========================================================================================
procedure TfrmMovExeSaidaTemp.bbtnConfirmarClick(Sender: TObject);
var
   bTransacao : boolean;

begin
   inherited;
   if edData.Text = '' then
   begin
      MsgDlg('Informe a data de saída dos bens deste termo!','Erro',mtError,[mbOK],0);
      edData.SetFocus;
      exit;
   end;
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
      //----------------------------------------------------------------------------------
      // Seta o Flag de Saída Temporária dos Bens
      //----------------------------------------------------------------------------------
      qrySelTermoBens.First;
      while not qrySelTermoBens.EOF do
      begin
         qryUpdBem.ParamByName('PIDBEM').AsInteger        := qrySelTermoBensIDBEM.AsInteger;
         qryUpdBem.ParamByName('PIDPESSOA').AsInteger     := qrySelTermoBensIDPESSOA.AsInteger;
         qryUpdBem.ParamByName('PFLGSAIDATEMP').AsInteger := 1;
         qryUpdBem.ExecSQL;
         //-------------------------------------------------------------------------------
         qrySelTermoBens.Next;
      end;
      //----------------------------------------------------------------------------------
      // Seta o Flag de Saída Temporária como executado
      //----------------------------------------------------------------------------------
      qryUpdTermoSaida.ParamByName('PIDSAIDATEMP').AsInteger := qrySelTermoIDSAIDATEMPORARIA.AsInteger;
      qryUpdTermoSaida.PAramByName('PDATA').AsDateTime       := edData.Date;
      qryUpdTermoSaida.ParamByName('PFLGEXEC').AsInteger     := 1;
      qryUpdTermoSaida.ExecSQL;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Efetivação de Termo de Saída Temporária') then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Screen.Cursor := crDefault;
      MsgDlg('Saida Temporária dos Bens Registrada!','Informação',mtInformation,[mbOk],0);
   except
      if bTransacao then
         RollBackTransacao;
      Screen.Cursor := crDefault;
      MsgDlg('Saida Temporária dos Bens não Registrada!','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
   bbtnSelTermo.SetFocus;
end;
//========================================================================================
procedure TfrmMovExeSaidaTemp.LimpaCampos;
begin
   qrySelTermoBens.Close;
   qrySelTermo.Close;
   pnlData.Enabled := False;
   edData.Text := '';
   bbtnSelTermo.SetFocus;
end;
//========================================================================================
procedure TfrmMovExeSaidaTemp.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;
//========================================================================================
procedure TfrmMovExeSaidaTemp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelTermo.Close;
   qrySelTermoBens.Close;
   qrySelTermo.UnPrepare;
   qrySelTermoBens.UnPrepare;
   qryUpdTermoSaida.UnPrepare;
   qryUpdBem.UnPrepare;
end;

end.
