unit FDesfazRegularizacao;
(* ------------------  Histórico de Alterações  ------------------------------*)
//Data.........: 16/07/2009
//SOL Nº.......: 121803
//KINTANA Nº...: 590323
//Responsável..: Cássio Rovaroto de Camargo
//Descrição....: Alterações para impedir que os filtros da tela seja esvaziados
//               após a Regularização.
//------------------------------------------------------------------------------
//Data.......: 16/01/2006
//Autor......: Rodolpho da Silva
//Pendência..: 21257
//Descrição..: Corrigir o método em que se desfaz a regularização dos
//             lançamentos conciliados
(* ---------------------------------------------------------------------------*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FSairAjuda, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, TREdit, Db, Wwdatsrc,
  DBClient, uCMClientDataSet,uCtrlRegNIDuplicados, uCtrlListTercFinanc,
  uCmSqlParams, Provider, DBTables, Wwquery;

type
  TfrmDesfazRegularizacao = class(TfrmSairAjuda)
    dsIdent: TwwDataSource;
    cdsIdent: TCMClientDataSet;
    cdsPortadorConta: TCMClientDataSet;
    dsConc: TwwDataSource;
    cdsConc: TCMClientDataSet;
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
    pnlGrids: TPanel;
    Splitter1: TSplitter;
    pnlNaoIdentificados: TPanel;
    pnlContaDe: TPanel;
    dbgContaDe: TwwDBGrid;
    pnlNaoConciliados: TPanel;
    pnlContaPara: TPanel;
    dbgNaoConciliados: TwwDBGrid;
    gbData: TGroupBox;
    edDataReg: TCMDateTimePicker;
    bbtnDesfazRegulariza: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionaClick(Sender: TObject);
    procedure bbtnDesfazRegularizaClick(Sender: TObject);
    procedure cdsIdentSTATUSCONCILIAChange(Sender: TField);
    procedure dbgContaDeCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgContaDeTopRowChanged(Sender: TObject);
    procedure dbgContaDeUpdateFooter(Sender: TObject);
    //Cássio - SOL Nº121803 KINTANA Nº 590323 - Início
    procedure ednValorFimEnter(Sender: TObject);


  private { Private declarations }

    CtrlListTerceiros : TCtrlListTercFinanc;
    CtrlRegNIDuplicados : TCtrlRegNIDuplicados;

    rTotalIdentificados, rTotalConciliados : Double;


  public  { Public declarations }


  end;




var
  frmDesfazRegularizacao: TfrmDesfazRegularizacao;



implementation
{$R *.DFM}
uses
  dBaseDados, uSistema, uMensErro, uCtrlParamIntegra;



procedure TfrmDesfazRegularizacao.FormCreate(Sender: TObject);
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
   cdsPortadorConta.Data:=CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa,0);

   //Carrega cdsIdent
   cdsIdent.Data:= CtrlRegNIDuplicados.ListaLancIdentificados(0,0,0,0,0); //vazio

   //Carrega cdsNaoIdentConc
   cdsConc.Data := cdsIdent.Data; //vazio

   //Associa Cds
   CtrlRegNIDuplicados.CdsIdent:=cdsIdent;
   CtrlRegNIDuplicados.CdsConc:=cdsConc;
end;



procedure TfrmDesfazRegularizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlRegNIDuplicados.Free;
   CtrlListTerceiros.Free;
   inherited;
end;



procedure TfrmDesfazRegularizacao.btnSelecionaClick(Sender: TObject);
var
   rCodPortador : Double;
   sIdRelacionani,sCodLancFinanc: string;
begin

   if Trim(edDataReg.Text)='' then
    begin
       MsgDlg('Obrigatório preencher a Data de Regularização','Erro',mtError,[mbOk],0);
       edDataReg.SetFocus;
       Exit;
    end;

   if (dblcPortador.Text<>'') then
      rCodPortador := StrToFloat(dblcPortador.LookupValue)
   else
      rCodPortador := 0;


   cdsIdent.Close;
   cdsConc.Close;

   //Carrega cdsIdent
   cdsIdent.Data:= CtrlRegNIDuplicados.ListaLancIdentificados(rCodPortador,
                                                              Sistema.IdEmpresa,
                                                              ednValorIni.Value,
                                                              ednValorFim.Value,
                                                              edDataReg.Date);

   TFloatField(cdsIdent.FieldByName('VALORLANCFINAN')).DisplayFormat  := '#,##0.00';
   TFloatField(cdsIdent.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
   TStringField(cdsIdent.FieldByName('STATUSCONCILIA')).OnChange      := cdsIdentSTATUSCONCILIAChange;

   cdsIdent.DisableControls;
   while not cdsIdent.Eof do
   begin
      sIdRelacionani := sIdRelacionani + QuotedStr(cdsIdent.FieldByName('CODREL').AsString);
      sCodLancFinanc := sCodLancFinanc + QuotedStr(cdsIdent.FieldByName('CODLANCFINANC').AsString);
      cdsIdent.Next;

      if not cdsIdent.Eof then
      begin
        sIdRelacionani := sIdRelacionani + ',';
        sCodLancFinanc := sCodLancFinanc + ',';
      end;
   end;
   cdsIdent.EnableControls;
   cdsIdent.First;

   if cdsIdent.IsEmpty then
   begin
      sCodLancFinanc := QuotedStr('-1');
      sIdRelacionani := QuotedStr('-1');
   end;

   //Carrega cdsNaoIdentConc
   cdsConc.Data := CtrlRegNIDuplicados.ListaLancConciliados(sIdRelacionani,sCodLancFinanc);

   TFloatField(cdsConc.FieldByName('VALORLANCFINAN')).DisplayFormat  :='#,##0.00';
   TFloatField(cdsConc.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
end;



procedure TfrmDesfazRegularizacao.cdsIdentSTATUSCONCILIAChange(
  Sender: TField);
begin
   cdsConc.DisableControls;

   if cdsIdent.FieldByName('STATUSCONCILIA').AsString = 'J' then
   begin
       cdsConc.First;
       while not cdsConc.Eof do
       begin
          if (cdsConc.FieldByName('CODREL').AsInteger =  cdsIdent.FieldByName('CODREL').AsInteger) then
          begin
             cdsConc.Edit;
             cdsConc.FieldByName('STATUSCONCILIA').AsString := 'X';
             cdsConc.Post;
          end;
          cdsConc.Next;
       end;
   end
   else
   begin
       cdsConc.First;
       while not cdsConc.Eof do
       begin
          if (cdsConc.FieldByName('CODREL').AsInteger =  cdsIdent.FieldByName('CODREL').AsInteger) then
          begin
             cdsConc.Edit;
             cdsConc.FieldByName('STATUSCONCILIA').AsString := 'I';
             cdsConc.Post;
          end;
          cdsConc.Next;
       end;

   end;
   cdsConc.EnableControls;

   // Somente para atualizar o total do grid
   cdsIdent.Edit;
   cdsIdent.Post;
   cdsConc.Edit;
   cdsConc.Post;
end;



procedure TfrmDesfazRegularizacao.bbtnDesfazRegularizaClick(Sender: TObject);
begin
   if (rTotalIdentificados = 0) then
   begin
      MsgDlg('Não Existe nenhum lançamento Identificado marcado.',
             'Erro',mtError,[mbOk],0);
      dbgContaDe.SetFocus;
      Exit;
   end;

   if (rTotalConciliados = 0) then
   begin
      MsgDlg('Não existe nenhum lançamento Conciliado marcado.','Erro',mtError,[mbOk],0);
      dbgNaoConciliados.SetFocus;
      Exit;
   end;
       
   if rTotalIdentificados <> rTotalConciliados then
   begin
      MsgDlg('Total dos identificados não confere com o total dos conciliados',
             'Erro',mtError,[mbOk],0);
      dbgContaDe.SetFocus;
      Exit;
   end;

    cdsIdent.DisableControls;
    cdsConc.DisableControls;
    try
       if not CtrlRegNIDuplicados.DesfazRegularizacao(Sistema.IdModulo,Sistema.IdEmpresa) then
          MsgDlg(CtrlRegNIDuplicados.MessageInfo,'Erro',mtError,[mbOk],0)
       else
       begin
          MsgDlg('Regularização desfeita com Sucesso!','Informação',mtInformation,[mbOk],0);
          //Limpa cds's
          cdsIdent.EmptyDataSet;
          cdsConc.EmptyDataSet;
          //Cássio - SOL Nº121803 KINTANA Nº 590323 - Início
          {Retirada a limpeza dos filtros para que sejam exibidas as últimas informações,
          conforme solicitado  em RM.}
          //Limpa Filtro
          //dblcPortador.Clear;
          //ednValorIni.Clear;
          //ednValorFim.Clear;
          //Limpa Data
          //edDataReg.ClearDateTime;
          //Cássio - SOL Nº121803 KINTANA Nº 590323 - Fim
       end;
       
    finally
       cdsIdent.EnableControls;
       cdsConc.EnableControls;
    end;
end;



procedure TfrmDesfazRegularizacao.dbgContaDeCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  // faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // amarelo bebê
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;




procedure TfrmDesfazRegularizacao.dbgContaDeTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;



procedure TfrmDesfazRegularizacao.dbgContaDeUpdateFooter(Sender: TObject);
var
  CdsAux: TClientDataSet;
  rTotal,rTotalOutraMoeda : Double;
begin
  inherited;
  try
     CdsAux           := TCMClientDataSet.Create(nil);
     rTotal           := 0;
     rTotalOutraMoeda := 0;
     CdsAux.Data      := TClientDataSet((sender as TwwDBGrid).DataSource.DataSet).Data;

     while not CdsAux.Eof do
     begin
        // Se o registro estiver marcado, faz a soma do total
        if CdsAux.FieldByName('STATUSCONCILIA').AsString = 'I' then
        begin
           if CdsAux.FieldByName('ENTRADASAIDA').AsString = 'E' then
           begin
              rTotal           := rTotal            + CdsAux.FieldByName('VALORLANCFINAN').AsFloat;
              rTotalOutraMoeda := rTotalOutraMoeda  + CdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
           end
           else
           begin
              rTotal           := rTotal            - CdsAux.FieldByName('VALORLANCFINAN').AsFloat;
              rTotalOutraMoeda := rTotalOutraMoeda  - CdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
           end;
        end;

        CdsAux.Next;
     end;

     rTotalIdentificados := rTotal;
     rTotalConciliados   := rTotal;
                                                   
    (sender as TwwDBGrid).ColumnByName('VALORLANCFINAN').FooterValue  := FormatFloat('#,##0.00',rTotal);
    (sender as TwwDBGrid).ColumnByName('VALOROUTRAMOEDA').FooterValue := FormatFloat('#,##0.00',rTotalOutraMoeda);
  finally
     FreeAndNil(CdsAux);
  end;
end;


//Cássio - SOL Nº121803 KINTANA Nº 590323 - Início
//Função para preencher o campo de Valor Final
procedure TfrmDesfazRegularizacao.ednValorFimEnter(Sender: TObject);
var
  dValorFinal : double;
begin
  inherited;
  dValorFinal := 0;
  if ednValorIni.Text <> '' then
  begin
    ednValorFim.Value := (ednValorIni.Value+ 1);
    dValorFinal := ednValorIni.Value+ 1;
    ednValorFim.Text := FloatToStr(dValorFinal);
  end;
end;
//Cássio - SOL Nº121803 KINTANA Nº 590323 - Fim
end.
