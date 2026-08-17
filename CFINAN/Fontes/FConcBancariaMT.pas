unit FConcBancariaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, TEdNum, Db, DBClient,
  uCMClientDataSet, uCtrlMovimFinanc, uCtrlListTercFinanc, uCtrlConcBancaria,
  Provider, DBTables, Wwquery, Wwdatsrc, uCmSqlParams;

type
  TfrmConcBancariaMT = class(TfrmOkCancelar)
    plnSaldos: TPanel;
    gbCorrente: TGroupBox;
    lblSaldoConciliadoAn: TLabel;
    lblSaldoConciliadoAt: TLabel;
    Label2: TLabel;
    gbOutraMoeda: TGroupBox;
    lblSaldoConciliaOMAt: TLabel;
    lblSaldoConciliaOMAn: TLabel;
    pnlDadosFiltro: TPanel;
    btnSeleciona: TBitBtn;
    gbSaldoExtrato: TGroupBox;
    lblSaldo: TLabel;
    Label1: TLabel;
    ednSaldoOMoeda: TRealEdit;
    ednSaldoCorrente: TRealEdit;
    gbData: TGroupBox;
    lblDataExtrato: TLabel;
    edDataExtrato: TCMDateTimePicker;
    gbBanco: TGroupBox;
    lblContaBanco: TLabel;
    dblcPortador: TwwDBLookupCombo;
    dbgExtrato: TwwDBGrid;
    cdsPortador: TCMClientDataSet;
    cdsExtrato: TCMClientDataSet;
    edSaldoAntesConc: TRealEdit;
    edSaldoConc: TRealEdit;
    edSaldoConcDiaAnt: TRealEdit;
    edSaldoOMAntesConc: TRealEdit;
    edSaldoOMConc: TRealEdit;
    dsExtrato: TwwDataSource;
    btnMarcaTodos: TSpeedButton;
    btnInverteMarcacao: TSpeedButton;
    spTeste: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgExtratoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btnSelecionaClick(Sender: TObject);
    procedure dblcPortadorExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnMarcaTodosClick(Sender: TObject);
    procedure btnInverteMarcacaoClick(Sender: TObject);
  private
    { Private declarations }
    sUltimoIndice : String;
    ExtratoVazio  : OleVariant;
    rSaldoCorrente : Double;
    rSaldoOutraMoeda : Double;
    CtrlMovimFinanc : TCtrlMovimFinanc;
    CtrlConcBancaria : TCtrlConcBancaria; 
    CtrlListTerceiros : TCtrlListTercFinanc;
    procedure cdsExtratoSTATUSCONCILIAChange(Sender: TField);
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmConcBancariaMT: TfrmConcBancariaMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmConcBancariaMT.FormCreate(Sender: TObject);
begin
   inherited;
   sUltimoIndice:='AscDATALANCFINAN';
   rSaldoCorrente:=0;
   rSaldoOutraMoeda:=0;

   //Inicializa CtrlMovimFinanc
   CtrlMovimFinanc:=TCtrlMovimFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                            Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carega cds de Extrato
   cdsExtrato.Data:=CtrlMovimFinanc.ListMovimFinancConciliacao(-1,-1); //vazio
   ExtratoVazio:=cdsExtrato.Data;

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   cdsPortador.Data:=CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa);                                

   //Inicializa CtrlConcBancaria
   CtrlConcBancaria:=TCtrlConcBancaria.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlConcBancaria.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlConcBancaria.cdsExtrato:=cdsExtrato;

   edDataExtrato.Date:=Date;
end;

procedure TfrmConcBancariaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//
end;

procedure TfrmConcBancariaMT.dbgExtratoTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  if not(cdsExtrato.Active) or (cdsExtrato.IsEmpty) or (AFieldName='STATUSCONCILIA') then Exit;

  if (AFieldName=sUltimoIndice) and (Trim(cdsExtrato.IndexName)=Trim('Asc'+AFieldName)) then
     cdsExtrato.IndexName:='Desc'+AFieldName
  else
     cdsExtrato.IndexName:='Asc'+AFieldName;

  sUltimoIndice:=AFieldName;
end;

procedure TfrmConcBancariaMT.dblcPortadorExit(Sender: TObject);
begin
   gbSaldoExtrato.Enabled := True;
   if (cdsPortador.FieldByName('MOECODIGO').AsFloat<>0) then
    begin
       ednSaldoCorrente.Enabled := False;
       ednSaldoOMoeda.Enabled   := True;
    end
   else
    begin
       ednSaldoCorrente.Enabled := True;
       ednSaldoOMoeda.Enabled   := False;
    end;
end;

procedure TfrmConcBancariaMT.btnSelecionaClick(Sender: TObject);
var
   rSaldoConcDiaAnt  : Double;
   rSaldoAntesConc   : Double;
   rSaldoOMAntesConc : Double;
   rSaldoConc        : Double;
   rSaldoOMConc      : Double;
begin
   inherited;
   if (Trim(dblcPortador.Text)='') then
    begin
       MsgDlg('Obrigatório preencher a Conta do Banco/Caixa que se Deseja Conciliar',
              'Erro',mtError,[mbOk],0);
       dblcPortador.SetFocus;
      Exit;
    end;

   if (Trim(edDataExtrato.Text)='') then
    begin
       MsgDlg('Obrigatório preencher a Data do Extrato que se Deseja Conciliar',
              'Erro',mtError,[mbOk],0);
       dblcPortador.SetFocus;
       Exit;
    end;

   cdsExtrato.Data:=CtrlMovimFinanc.ListMovimFinancConciliacao(StrToFloat(dblcPortador.LookupValue),
                                                               Sistema.IdEmpresa);
   btnMarcaTodos.Enabled:=not(cdsExtrato.IsEmpty);
   btnInverteMarcacao.Enabled:=not(cdsExtrato.IsEmpty);

   TFloatField(cdsExtrato.FieldByName('VALORLANCFINAN')).DisplayFormat:='#,##0.00';
   TFloatField(cdsExtrato.FieldByName('VALOROUTRAMOEDA')).DisplayFormat:='#,##0.00';

   TStringField(cdsExtrato.FieldByName('STATUSCONCILIA')).OnChange:=cdsExtratoSTATUSCONCILIAChange;

   cdsExtrato.IndexName:='AscDATALANCFINAN';

   if not(CtrlConcBancaria.CalculaSaldos(rSaldoConcDiaAnt,rSaldoAntesConc,rSaldoOMAntesConc,
                                     rSaldoConc,rSaldoOMConc,StrToFloat(dblcPortador.LookupValue),
                                     edDataExtrato.Date)) then
      MsgDlg(CtrlConcBancaria.MessageInfo,'Erro',mtError,[mbOk],0)
   else
    begin
       rSaldoCorrente:=rSaldoConc;
       rSaldoOutraMoeda:= rSaldoOMConc;
       edSaldoConcDiaAnt.Value:=rSaldoConcDiaAnt;
       edSaldoAntesConc.Value:=rSaldoAntesConc;
       edSaldoConc.Value:=rSaldoConc;
       edSaldoOMAntesConc.Value:=rSaldoOMAntesConc;
       edSaldoOMConc.Value:=rSaldoOMConc;
    end;
end;

procedure TfrmConcBancariaMT.cdsExtratoSTATUSCONCILIAChange(Sender: TField);
begin
   if cdsExtrato.FieldByName('STATUSCONCILIA').AsString = 'P' then
    begin
       if cdsExtrato.FieldByName('ENTRADASAIDA').AsString = 'E' then
        begin
           rSaldoCorrente   := rSaldoCorrente   + cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
           rSaldoOutraMoeda := rSaldoOutraMoeda + cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
        end
       else
        begin
           rSaldoCorrente   := rSaldoCorrente   - cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
           rSaldoOutraMoeda := rSaldoOutraMoeda - cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
        end;
    end
   else
    begin
       if cdsExtrato.FieldByName('ENTRADASAIDA').AsString = 'E' then
        begin
           rSaldoCorrente   := rSaldoCorrente   - cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
           rSaldoOutraMoeda := rSaldoOutraMoeda - cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
        end
       else
        begin
           rSaldoCorrente   := rSaldoCorrente   + cdsExtrato.FieldByName('VALORLANCFINAN').AsFloat;
           rSaldoOutraMoeda := rSaldoOutraMoeda + cdsExtrato.FieldByName('VALOROUTRAMOEDA').AsFloat;
        end;
    end;

   edSaldoConc.Value:=rSaldoCorrente;
   edSaldoOMConc.Value:=rSaldoOutraMoeda;
end;

procedure TfrmConcBancariaMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   //Aplica Marcações
   if not(CtrlConcBancaria.AplicaMarcacoes) then
    begin
       MsgDlg(CtrlConcBancaria.MessageInfo,'Aviso',mtWarning,[mbOk],0);
       Exit;
    end;

   if (cdsPortador.FieldByName('MOECODIGO').AsFloat<>0) then
    begin
       if Format('%17.2f',[rSaldoOutraMoeda]) <> Format('%17.2f',[ednSaldoOMoeda.Value]) then
        begin
           MsgDlg('Saldo Conciliado não bate com o Saldo do Extrato.Verifique','Erro',mtError,[mbOk],0);
           ednSaldoOMoeda.SetFocus;
           Exit;
        end;
    end
   else
    if Format('%17.2f',[rSaldoCorrente]) <> Format('%17.2f',[ednSaldoCorrente.Value]) then
     begin
        MsgDlg('Saldo Conciliado não bate com o Saldo do Extrato.Verifique','Erro',mtError,[mbOk],0);
        ednSaldoCorrente.SetFocus;
        Exit;
     end;

   //Aplica Conciliação
   if not(CtrlConcBancaria.Concilia(StrToFloat(dblcPortador.LookupValue),edDataExtrato.Date)) then
      MsgDlg(CtrlConcBancaria.MessageInfo,'Aviso',mtWarning,[mbOk],0)
   else
    begin
       MsgDlg('Conciliação Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
       LimpaCampos;
    end;
end;

procedure TfrmConcBancariaMT.LimpaCampos;
begin
   //Limpa cdsExtrato
   cdsExtrato.Close;

   cdsExtrato.IndexName:='AscDATALANCFINAN';
   cdsExtrato.Data:=ExtratoVazio;

   dblcPortador.Text:='';
   edDataExtrato.Date:=Date;
   ednSaldoCorrente.Value:=0;
   ednSaldoOMoeda.Value:=0;
   edSaldoConcDiaAnt.Value:=0;
   edSaldoAntesConc.Value:=0;
   edSaldoConc.Value:=0;
   edSaldoOMAntesConc.Value:=0;
   edSaldoOMConc.Value:=0;

   rSaldoCorrente:=0;
   rSaldoOutraMoeda:=0;

   dblcPortador.SetFocus;
end;

procedure TfrmConcBancariaMT.btnMarcaTodosClick(Sender: TObject);
begin
   cdsExtrato.First;
   while not(cdsExtrato.Eof) do
   begin
      if (cdsExtrato.FieldByName('STATUSCONCILIA').AsString <> 'P') then
       begin
          cdsExtrato.Edit;
          cdsExtrato.FieldByName('STATUSCONCILIA').AsString:='P';
          cdsExtrato.Post;
       end;
      cdsExtrato.Next;
   end;
end;

procedure TfrmConcBancariaMT.btnInverteMarcacaoClick(Sender: TObject);
begin
   cdsExtrato.First;
   while not(cdsExtrato.Eof) do
   begin
      if (cdsExtrato.FieldByName('STATUSCONCILIA').AsString <> 'P') then
       begin
          cdsExtrato.Edit;
          cdsExtrato.FieldByName('STATUSCONCILIA').AsString:='P';
          cdsExtrato.Post;
       end
      else
       begin
          cdsExtrato.Edit;
          cdsExtrato.FieldByName('STATUSCONCILIA').AsString:='N';
          cdsExtrato.Post;
       end;

      cdsExtrato.Next;
   end;
end;

end.
