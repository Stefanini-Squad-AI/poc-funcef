unit FRegNIDuplicadosMT;


(* ------------------  Histórico de Alterações  ------------------------------*)
// Alterado por Arnaldo V. Scarin, em 28/12/2009
// SOL.: 128563 Kintana: 690151
// Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
// deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
// para o plano "Operações Comuns", e esse deverá ser trocado para o plano
// específico para o PGA
(* ---------------------------------------------------------------------------*)
//Data.........: 16/07/2009
//SOL Nº.......: 121803
//KINTANA Nº...: 590323
//Responsável..: Cássio Rovaroto de Camargo
//Descrição....: Alterações para impedir que os filtros da tela seja esvaziados
//               após a Regularização.
(* ---------------------------------------------------------------------------*)
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FSairAjuda, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, TREdit, Db, Wwdatsrc,
  DBClient, uCMClientDataSet,uCtrlRegNIDuplicados, uCtrlListTercFinanc,
  uCmSqlParams, Provider, DBTables, Wwquery, CmParamReport;

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
    CmDataRegularizacao: TCmParamReport;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnRegularizaClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure dbgContaDeCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgContaDeTopRowChanged(Sender: TObject);
    procedure dbgContaDeUpdateFooter(Sender: TObject);
    //Cássio - SOL Nº121803 KINTANA Nº 590323
    procedure ednValorFimEnter(Sender: TObject);


  private { Private declarations }

    CtrlListTerceiros   : TCtrlListTercFinanc;
    CtrlRegNIDuplicados : TCtrlRegNIDuplicados;

    rTotalNI, rTotalNC : Double;

    procedure cdsNaoIdentSTATUSCONCILIAChange(Sender: TField);
    procedure cdsNaoConcSTATUSCONCILIAChange(Sender: TField);
    // Alterado por Arnaldo V. Scarin, em 28/12/2009
    // SOL.: 128563 Kintana: 690151
    // Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
    // deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
    // para o plano "Operações Comuns", e esse deverá ser trocado para o plano
    // específico para o PGA
    function SelecionaPlanoPGA(var pIdPlano,pIdPatro: Integer): Boolean;


  public  { Public declarations }


  end;

var
  frmRegNIDuplicadosMT: TfrmRegNIDuplicadosMT;



implementation
{$R *.DFM}
uses
  dBaseDados, uSistema, uMensErro, uCtrlParamIntegra;



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
   cdsPortadorConta.Data:=CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa,0);

   //Carrega cdsNaoIdent
   cdsNaoIdent.Data:=CtrlRegNIDuplicados.ListNaoIdentNaoConc(0,0,'I',0,0); //vazio

   //Carrega cdsNaoIdentConc
   cdsNaoConc.Data:=cdsNaoIdent.Data; //vazio

   //Associa Cds
   CtrlRegNIDuplicados.CdsNaoIdent := cdsNaoIdent;
   CtrlRegNIDuplicados.CdsNaoConc  := cdsNaoConc;
end;



procedure TfrmRegNIDuplicadosMT.FormClose(Sender: TObject; var Action: TCloseAction);
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


   cdsNaoIdent.Close;
   cdsNaoConc.Close;

   //Carrega cdsNaoIdentifcados
   cdsNaoIdent.Data:=CtrlRegNIDuplicados.ListNaoIdentNaoConc(rCodPortador,
                                                             Sistema.IdEmpresa,
                                                             'I',
                                                             ednValorIni.Value,
                                                             ednValorFim.Value);

   TFloatField(cdsNaoIdent.FieldByName('VALORLANCFINAN')).DisplayFormat:='#,##0.00';
   TStringField(cdsNaoIdent.FieldByName('STATUSCONCILIA')).OnChange:=cdsNaoIdentSTATUSCONCILIAChange;

   // Determina o ID do relacionamento para poder determinar de 1 para "n"
   CtrlRegNIDuplicados.GerarIdRelacionaniCdsNaoIdentif;



   //Carrega cdsNaoIdentConc
   cdsNaoConc.Data := CtrlRegNIDuplicados.ListNaoIdentNaoConc(rCodPortador,
                                                              Sistema.IdEmpresa,
                                                              'N',
                                                              ednValorIni.Value,
                                                              ednValorFim.Value);
   TFloatField(cdsNaoConc.FieldByName('VALORLANCFINAN')).DisplayFormat:='#,##0.00';
   TStringField(cdsNaoConc.FieldByName('STATUSCONCILIA')).OnChange:=cdsNaoConcSTATUSCONCILIAChange;
end;




procedure TfrmRegNIDuplicadosMT.cdsNaoIdentSTATUSCONCILIAChange(
  Sender: TField);
begin
      // Para lanmçamentos NÃO-IDENTIFICADOS

      //   Se o usuário desmarcar o registro (I), desmarcar também TODOS  os relacionamentos
      // de não-conciliados feitos para este registros.
      cdsNaoConc.DisableControls;
      if cdsNaoIdent.FieldByName('STATUSCONCILIA').AsString = 'I' then
      begin
         cdsNaoConc.First;
         while not cdsNaoConc.Eof do
         begin
            if cdsNaoConc.FieldByName('IDRELACIONANI').AsFloat = cdsNaoIdent.FieldByName('IDRELACIONANI').AsFloat then
            begin
               cdsNaoConc.Edit;
               cdsNaoConc.FieldByName('IDRELACIONANI').AsFloat   := 0;
               cdsNaoConc.FieldByName('STATUSCONCILIA').AsString := 'N';
               if cdsNaoConc.State in [dsEdit,dsInsert] then
                  CdsNaoConc.Post;
            end;

            cdsNaoConc.Next;
         end;

      end;
      if cdsNaoIdent.State in [dsEdit,dsInsert] then
         cdsNaoIdent.Post;

      cdsNaoConc.EnableControls;
      // Só para forçar a atualização o valor do grid dbgNaoConciliados
      cdsNaoConc.Edit;
      cdsNaoConc.Post;

      dbgContaDe.InvalidateFooter;
      cdsNaoConc.First;
end;




procedure TfrmRegNIDuplicadosMT.cdsNaoConcSTATUSCONCILIAChange(
  Sender: TField);

begin
   // Para lançamentos NÃO-CONCILIADOS

   // Se o usuário marcar o registro (X)...
   if cdsNaoConc.FieldByName('STATUSCONCILIA').AsString = 'X' then
   begin
       // Atribui o id do relacionamento do Não-Identificado com o Não-Conciliado. (1 para "n")
       if cdsNaoIdent.FieldByName('STATUSCONCILIA').AsString = 'J' then
       begin
          cdsNaoConc.Edit;
          cdsNaoConc.FieldByName('IDRELACIONANI').AsFloat := cdsNaoIdent.FieldByName('IDRELACIONANI').AsFloat;
          cdsNaoConc.Post;
       end
       else
          cdsNaoConc.FieldByName('STATUSCONCILIA').AsString := 'N';
   end
   else

   //   Se o usuário desmarcar o registro (N), zerar o id do relacionamento
   // do registro que está sendo desmarcado
   begin
      cdsNaoConc.Edit;
      cdsNaoConc.FieldByName('IDRELACIONANI').AsFloat := 0;
      cdsNaoConc.Post;
   end;

   if cdsNaoIdent.State in [dsEdit,dsInsert] then
      cdsNaoIdent.Post;
end;




procedure TfrmRegNIDuplicadosMT.bbtnRegularizaClick(Sender: TObject);
var
iIdPlano, iIdPatro : integer;
qryAux : Tquery;
begin
  qryAux := TQuery.Create(Nil);
  qryAux.DatabaseName := 'BaseDados';
   if rTotalNI = 0 then
   begin
      MsgDlg('Não Existe nenhum lançamento Não Identificado marcado.','Erro',mtError,[mbOk],0);
      dbgContaDe.SetFocus;
      Exit;
   end;

   if rTotalNC = 0 then
   begin
      MsgDlg('Não existe nenhum lançamento Não Conciliado marcado.','Erro',mtError,[mbOk],0);
      dbgNaoConciliados.SetFocus;
      Exit;
   end;


   if (rTotalNI <>rTotalNC) then
   begin
      MsgDlg('Total dos não identificados não bate com o total dos não conciliados','Erro',mtError,[mbOk],0);
      dbgContaDe.SetFocus;
      Exit;
   end;

   CmDataRegularizacao.Execute;
   if CmDataRegularizacao.ParamByName('DATAREGU').AsString = '' then
   begin
      MsgDlg('Obrigatório preencher a Data de Regularização','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;

   // Alterado por Arnaldo V. Scarin, em 28/12/2009
   // SOL.: 128563 Kintana: 690151
   // Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
   // deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
   // para o plano "Operações Comuns", e esse deverá ser trocado para o plano
   // específico para o PGA

   // SOL155431/4361  Felipe de Oliveira
   // se a data for maior que 31/12/2009 e o plano for do tipo operações comuns, ele mudará de plano e passará a ser o pga

   qryAux.Close;
   qryAux.SQL.Add('SELECT IDPLANOPREV FROM RATEIOFINANC WHERE IDPLANOPREV = 29 AND CODLANCFINANC = :PCODLANCFINANC');
   qryAux.ParamByName('PCODLANCFINANC').AsInteger := cdsNaoIdent.FieldByName('CODLANCFINANC').AsInteger;
   qryAux.Open;

   If (CmDataRegularizacao.ParamByName('DATAREGU').AsDateTime > StrToDate('31/12/2009')) and
       (qryAux.FieldByName('IDPLANOPREV').AsInteger = 29)  then
   begin
     If Not SelecionaPlanoPGA(iIdPlano,iIdPatro) then
     begin
       MsgDlg('Não foi encontrado nenhum plano como de Uso exclusivo PGA!','Erro',mtError,[mbOk],0);
       exit;
     end;
   end
   else
   begin
     iIdPlano := ParamIntegra.Plano;
     iIdPatro := 0;
   end;
   cdsNaoIdent.DisableControls;
   cdsNaoConc.DisableControls;
   try
      if not(CtrlRegNIDuplicados.Regulariza(CmDataRegularizacao.ParamByName('DATAREGU').AsDateTime,
                                            iIdPlano,
                                            ParamIntegra.IntegraContab)) then
         MsgDlg(CtrlRegNIDuplicados.MessageInfo,'Erro',mtError,[mbOk],0)
      else
       begin
          MsgDlg('Regularização Efetuada com Sucesso!','Informação',mtInformation,[mbOk],0);
          //Limpa cds's
          cdsNaoIdent.EmptyDataSet;
          cdsNaoConc.EmptyDataSet;
          //Cássio - SOL Nº121803 KINTANA Nº 590323 - Início
          {Retirada a limpeza dos filtros para que sejam exibidas as últimas informações,
          conforme solicitado  em RM.}
          //Limpa Filtro
          //dblcPortador.Clear;
          //ednValorIni.Clear;
          //ednValorFim.Clear;
          //Cássio - SOL Nº121803 KINTANA Nº 590323 - Fim
       end;
   finally
      cdsNaoIdent.EnableControls;
      cdsNaoConc.EnableControls;
   end;
end;

// Alterado por Arnaldo V. Scarin, em 28/12/2009
// SOL.: 128563 Kintana: 690151
// Valida a Data de reguralização, e se essa data for maior que 31/12/2009,
// deverá ser valido o IdPlanoPrev (que contem a informação do Plano Prev Contabil,
// para o plano "Operações Comuns", e esse deverá ser trocado para o plano
// específico para o PGA
Function TfrmRegNIDuplicadosMT.SelecionaPlanoPGA(var pIdPlano,pIdPatro : Integer) : Boolean;
var oQry : TQuery;
begin
  pIdPlano := -1;
  pIdPatro := -1;
  oQry := TQuery.Create(Nil);
  Try
    With oQry do
    Begin
      DatabaseName := 'BaseDados';
      SQL.Text := 'select ppc.idplanoprev,                    ' + #13#10 +
                  '       ppcp.idpatro                        ' + #13#10 +
                  'from PlanPrevContabil ppc,                 ' + #13#10 +
                  '     PlanPrevContabPatro ppcp              ' + #13#10 +
                  'where ppc.idplanoprev = ppcp.idplanoprev   ' + #13#10 +
                  '  and ppc.flgusopga = ''S''                ' + #13#10 +
                  '  and ppc.ativo = ''S'''                   ;
      Open;
      Result := Not IsEmpty;
      If Result then
      begin
        pIdPlano := FieldByName('IdPlanoPrev').asInteger;
        pIdPatro := FieldByName('IdPatro').asInteger;
      end;
      Close;
    end;
  finally
    FreeAndNil(oQry);
  end;
end;

procedure TfrmRegNIDuplicadosMT.dbgContaDeCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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




procedure TfrmRegNIDuplicadosMT.dbgContaDeTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TfrmRegNIDuplicadosMT.dbgContaDeUpdateFooter(Sender: TObject);
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
        if CdsAux.FieldByName('STATUSCONCILIA').AsString[1] in ['J','X'] then
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

     if (sender as TwwDBGrid).Name = 'dbgContaDe' then
        rTotalNI := rTotal
     else
        rTotalNC := rTotal;


     (sender as TwwDBGrid).ColumnByName('VALORLANCFINAN').FooterValue  := FormatFloat('#,##0.00',rTotal);
     (sender as TwwDBGrid).ColumnByName('VALOROUTRAMOEDA').FooterValue := FormatFloat('#,##0.00',rTotalOutraMoeda);

  finally
     FreeAndNil(CdsAux);
  end;
end;


//Cássio - SOL Nº121803 KINTANA Nº 590323 - Início
//Função para preencher o campo de Valor Final
procedure TfrmRegNIDuplicadosMT.ednValorFimEnter(Sender: TObject);
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
