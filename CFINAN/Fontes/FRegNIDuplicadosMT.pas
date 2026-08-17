unit FRegNIDuplicadosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FSairAjuda, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, TREdit, Db, Wwdatsrc,
  DBClient, uCMClientDataSet,uCtrlRegNIDuplicados, uCtrlListTercFinanc,
  uCmSqlParams, Provider, DBTables, Wwquery;

type
  TfrmRegNIDuplicadosMT = class(TfrmSairAjuda)
    bbtnRegulariza: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pnlDadosFiltro: TPanel;
    btnSeleciona: TBitBtn;
    gbFaixaValor: TGroupBox;
    lblSaldo: TLabel;
    Label1: TLabel;
    ednValorFim: TRealEdit;
    ednValorIni: TRealEdit;
    gbBanco: TGroupBox;
    lblContaBanco: TLabel;
    dblcPortador: TwwDBLookupCombo;
    pnlRodape: TPanel;
    gbTotais: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    reNaoConc: TRealEdit;
    reNaoIdent: TRealEdit;
    gbData: TGroupBox;
    edDataReg: TCMDateTimePicker;
    pnlGrids: TPanel;
    cdsPortadorConta: TCMClientDataSet;
    cdsNaoIdent: TCMClientDataSet;
    cdsNaoConc: TCMClientDataSet;
    dsNaoConc: TwwDataSource;
    dsNaoIdent: TwwDataSource;
    pnlNaoIdentificados: TPanel;
    pnlContaDe: TPanel;
    Splitter1: TSplitter;
    pnlNaoConciliados: TPanel;
    pnlContaPara: TPanel;
    dbgNaoConciliados: TwwDBGrid;
    dbgContaDe: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnRegularizaClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
  private
    { Private declarations }
    CtrlListTerceiros : TCtrlListTercFinanc;
    CtrlRegNIDuplicados : TCtrlRegNIDuplicados;
    DadosVazio : OleVariant;

    procedure cdsNaoIdentSTATUSCONCILIAChange(Sender: TField);
    procedure cdsNaoConcSTATUSCONCILIAChange(Sender: TField);
  public
    { Public declarations }
  end;

var
  frmRegNIDuplicadosMT: TfrmRegNIDuplicadosMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, uCtrlParamIntegra;

procedure TfrmRegNIDuplicadosMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlRegNIDuplicados
   CtrlRegNIDuplicados:=TCtrlRegNIDuplicados.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                                    Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlRegNIDuplicados.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cds do Combo de Contas Bancárias
   cdsPortadorConta.Data:=CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa);

   //Carrega cdsNaoIdent
   cdsNaoIdent.Data:=CtrlRegNIDuplicados.ListNaoIdentNaoConc(0,0,'I',0,0); //vazio

   //Carrega cdsNaoIdentConc
   cdsNaoConc.Data:=cdsNaoIdent.Data; //vazio
   DadosVazio:=cdsNaoIdent.Data;

   //Associa Cds
   CtrlRegNIDuplicados.CdsNaoIdent:=cdsNaoIdent;
   CtrlRegNIDuplicados.CdsNaoConc:=cdsNaoConc;
end;

procedure TfrmRegNIDuplicadosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlRegNIDuplicados.Free;
   CtrlListTerceiros.Free;
   inherited;
end;

procedure TfrmRegNIDuplicadosMT.btnSelecionaClick(Sender: TObject);
var
   rCodPortador : Double;
begin
   if (dblcPortador.Text<>'') then
      rCodPortador:=StrToFloat(dblcPortador.LookupValue)
   else
      rCodPortador:=0;

   //Limpa Totais
   reNaoIdent.Clear;
   reNaoConc.Clear;


   cdsNaoIdent.Close;
   cdsNaoConc.Close;

   //Carrega cdsNaoIdent
   cdsNaoIdent.Data:=CtrlRegNIDuplicados.ListNaoIdentNaoConc(rCodPortador,
                                                             Sistema.IdEmpresa,
                                                             'I',
                                                             ednValorIni.Value,
                                                             ednValorFim.Value);

   TFloatField(cdsNaoIdent.FieldByName('VALORLANCFINAN')).DisplayFormat:='#,##0.00';
   TStringField(cdsNaoIdent.FieldByName('STATUSCONCILIA')).OnChange:=cdsNaoIdentSTATUSCONCILIAChange;


   //Carrega cdsNaoIdentConc
   cdsNaoConc.Data:=CtrlRegNIDuplicados.ListNaoIdentNaoConc(rCodPortador,
                                                            Sistema.IdEmpresa,
                                                            'N',
                                                            ednValorIni.Value,
                                                            ednValorFim.Value);

   TFloatField(cdsNaoConc.FieldByName('VALORLANCFINAN')).DisplayFormat:='#,##0.00';
   TStringField(cdsNaoConc.FieldByName('STATUSCONCILIA')).OnChange:=cdsNaoConcSTATUSCONCILIAChange;

end;

procedure TfrmRegNIDuplicadosMT.cdsNaoIdentSTATUSCONCILIAChange(
  Sender: TField);
var
   rTotalNaoIdent : Double;
begin
   rTotalNaoIdent:=reNaoIdent.Value;

   if cdsNaoIdent.FieldByName('STATUSCONCILIA').AsString = 'J' then
    begin
       if cdsNaoIdent.FieldByName('ENTRADASAIDA').AsString = 'E' then
          rTotalNaoIdent:=rTotalNaoIdent+cdsNaoIdent.FieldByName('VALORLANCFINAN').AsFloat
       else
          rTotalNaoIdent:=rTotalNaoIdent-cdsNaoIdent.FieldByName('VALORLANCFINAN').AsFloat;
    end
   else
    if cdsNaoIdent.FieldByName('ENTRADASAIDA').AsString = 'E' then
       rTotalNaoIdent:=rTotalNaoIdent-cdsNaoIdent.FieldByName('VALORLANCFINAN').AsFloat
    else
       rTotalNaoIdent:=rTotalNaoIdent+cdsNaoIdent.FieldByName('VALORLANCFINAN').AsFloat;

   reNaoIdent.Value:=rTotalNaoIdent;

end;

procedure TfrmRegNIDuplicadosMT.cdsNaoConcSTATUSCONCILIAChange(
  Sender: TField);
var
   rTotalNaoConc : Double;
begin
   rTotalNaoConc:=reNaoConc.Value;

   if cdsNaoConc.FieldByName('STATUSCONCILIA').AsString = 'X' then
    begin
       if cdsNaoConc.FieldByName('ENTRADASAIDA').AsString = 'E' then
          rTotalNaoConc:=rTotalNaoConc+cdsNaoConc.FieldByName('VALORLANCFINAN').AsFloat
       else
          rTotalNaoConc:=rTotalNaoConc-cdsNaoConc.FieldByName('VALORLANCFINAN').AsFloat;
    end
   else
    if cdsNaoConc.FieldByName('ENTRADASAIDA').AsString = 'E' then
       rTotalNaoConc:=rTotalNaoConc-cdsNaoConc.FieldByName('VALORLANCFINAN').AsFloat
    else
       rTotalNaoConc:=rTotalNaoConc+cdsNaoConc.FieldByName('VALORLANCFINAN').AsFloat;

   reNaoConc.Value:=rTotalNaoConc;
end;

procedure TfrmRegNIDuplicadosMT.bbtnRegularizaClick(Sender: TObject);
begin
  if (reNaoIdent.Value=0) then
   begin
      MsgDlg('Não Existe nenhum lançamento não Identificado marcado.',
             'Erro',mtError,[mbOk],0);
      dbgContaDe.SetFocus;
      Exit;
   end;

  if (reNaoConc.Value=0) then
   begin
      if MsgDlg('Não existe nenhum lançamento não conciliado marcado. Confirma ?',
                'Confirmação',mtConfirmation,[mbOk,mbCancel],0) = mrCancel then
       begin
          dbgContaDe.SetFocus;
          Exit;
       end;
   end;

  if Format('%17.2f',[reNaoConc.Value])<>Format('%17.2f',[reNaoIdent.Value]) then
   begin
      MsgDlg('Total dos não identificados não bate com o total dos não conciliados',
             'Erro',mtError,[mbOk],0);
      dbgContaDe.SetFocus;
      Exit;
   end;

  if Trim(edDataReg.Text)='' then
   begin
      MsgDlg('Obrigatório preencher a Data de Regularização','Erro',mtError,[mbOk],0);
      edDataReg.SetFocus;
      Exit;
   end;

   cdsNaoIdent.DisableControls;
   cdsNaoConc.DisableControls;
   try
      if not(CtrlRegNIDuplicados.Regulariza(edDataReg.Date,ParamIntegra.Plano,
                                            ParamIntegra.IntegraContab)) then
         MsgDlg(CtrlRegNIDuplicados.MessageInfo,'Erro',mtError,[mbOk],0)
      else
       begin
          MsgDlg('Regularização Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
          //Limpa cds's
          cdsNaoIdent.Data:=DadosVazio;
          cdsNaoConc.Data:=DadosVazio;
          //Limpa Totais
          reNaoIdent.Clear;
          reNaoConc.Clear;
          //Limpa Filtro
          dblcPortador.Clear;
          ednValorIni.Clear;
          ednValorFim.Clear;
          //Limpa Data
          edDataReg.ClearDateTime;
       end;
   finally
      cdsNaoIdent.EnableControls;
      cdsNaoConc.EnableControls;
   end;
end;

end.
