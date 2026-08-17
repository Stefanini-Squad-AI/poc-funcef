unit FRentabilidadeContabilMT;

interface

{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 27/10/2007
  Pendência    :
  Metodo       : Relatorio
  Descrição    : Acerto nas totalizações mensais
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 19/09/2007
  Pendência    : 26384
  Metodo       : Botão Cancelar
  Descrição    : zerar o CDSRentab pra não por lixo no resultado e corrigido o valor mensal.
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 05/09/2007
  Pendência    : 26237
  Metodo       : diversos
  Descrição    : Corrigido cálculo de rentabilidade, corrigida query q trazia valores inválido.
                 quando não existia valor.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 19/09/2006
  Pendência    : 22024
  Metodo       : diversos
  Descrição    : Se não for passada nenhuma rentabilidade contabil trazer todas
                 as rentabilidades.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Rodolpho da Silva
  Data         : 09/05/2006
  Pendência    : 22202
  Metodo       : diversos
  Descrição    : Implementado flg que desconsidera as contas de encerramento de
                 resultado, além de melhorias na tela
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 08/09/05
  Pendência    : Erro no cálculo da rentabilidade
  Metodo       : btOk.Click
  Descrição    : Inserido o roundCm nas rotinas de acumular os valores
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Rodolpho da Silva
  Data         : 02/09/05
  Pendência    : 20096 - Imprimir a rentabilidade para dias não úteis
  Metodo       : btOk.Click
  Descrição    : Correção de cálculos nos valores de rentabilidade mensal
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 26/07/05
  Pendência    : 19813 - Imprimir a rentabilidade para dias não úteis
  Metodo       : sqlBuscaContab
                 MontaQuery
  Solução      : Criada uma query virtual com todos os dias do fluxo para totalizar
                 todos os dias
                 COLOCADO #13 NO FINAL DA QUERY
------------------------------------------------------------------------------}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls,
  Grids, Wwdbigrd, Wwdbgrid, dxTL, dxCntner, uCtrlParamIntegra, Db,
  DBClient, uCMClientDataSet, uCtrlSPCConsiste, uCtrlPeriodo, uCtrlContab,
  dBaseDados, uSistema, Mask, wwclient, uCmSqlParams,
  Wwdatsrc, wwdblook, uMensErro, uDiasUteis, JclStrings, uCtrlPadroes,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  CmParamReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, FPreview,
  FProgresso, ppStrtch, ppSubRpt, uCMMath;

type
  TFrmRentabilidadeContabilMT = class(TfrmOkCancelar)
    grpDatas: TGroupBox;
    bbtnImprimir: TBitBtn;
    CdsSpcConsiste: TCMClientDataSet;
    dsPlanoPrev: TDataSource;
    dsPatro: TDataSource;
    CdsResult: TCMClientDataSet;
    dsResult: TwwDataSource;
    lblMes: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    dblkExercicio: TwwDBLookupCombo;
    lblExercicio: TLabel;
    dblkPeriodoFim: TwwDBLookupCombo;
    lblMesFinal: TLabel;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    cdsPeriodoFim: TCMClientDataSet;
    ppBDEPipeline1: TppBDEPipeline;
    CdsFundacao: TCMClientDataSet;
    dsFundacao: TwwDataSource;
    pplFundacao: TppBDEPipeline;
    ppReport1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel21: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    lbPatro: TppLabel;
    lbPlano: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLine1: TppLine;
    lbVlrRentDia: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLine2: TppLine;
    lbSistema: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel53: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel54: TppLabel;
    ppLine4: TppLine;
    ppSummaryBand2: TppSummaryBand;
    pgcPatroPlanoResult: TPageControl;
    tbsPlanoPatro: TTabSheet;
    tbsResult: TTabSheet;
    grpPatro: TGroupBox;
    dbgrPatro: TwwDBGrid;
    grpPlanoPrev: TGroupBox;
    dbgrPlanoPrev: TwwDBGrid;
    grpResultados: TGroupBox;
    dbgResult: TwwDBGrid;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    CdsPatro: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    chkDesconsidera: TCheckBox;
    ppSystemVariable1: TppSystemVariable;
    lbObs: TppLabel;
    shpCorZebra: TppShape;
    tbRentab: TTabSheet;
    dbgridRentab: TwwDBGrid;
    dsSpcConsiste: TDataSource;
    CMSqlParams1: TCMSqlParams;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppLine5: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine3: TppLine;
    vAcumPeriodo: TppVariable;
    vAcumMensal: TppVariable;
    dbRentMensal: TppDBText;
    dbRentPer: TppDBText;
    dsRentab: TwwDataSource;
    dbPlREntab: TppBDEPipeline;
    cdsRentab: TCMClientDataSet;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLblCalcAcumulaMes: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBText9: TppDBText;
    ppCalcAcumuladoMensal: TppDBCalc;
    ppLine6: TppLine;
    ppLabel14: TppLabel;
    dbPlREntabppField1: TppField;
    ppDBText10: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ppLabel28Print(Sender: TObject);
    procedure ppLabel29Print(Sender: TObject);
    procedure ppLabel33Print(Sender: TObject);
    procedure ppLabel42Print(Sender: TObject);
    procedure ppLabel54Print(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CdsResultAfterOpen(DataSet: TDataSet);
    procedure cdsPlanoPrevAfterOpen(DataSet: TDataSet);
    procedure dbgrPatroCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrPatroTopRowChanged(Sender: TObject);
    procedure lbSistemaPrint(Sender: TObject);
    procedure lbObsPrint(Sender: TObject);
    procedure shpCorZebraPrint(Sender: TObject);
    procedure dbgridRentabCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbRentMensalPrint(Sender: TObject);
    procedure dbRentPerPrint(Sender: TObject);
    procedure lbVlrRentDiaPrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure ppSubReport1Print(Sender: TObject);
    procedure ppGroupFooterBand2AfterPrint(Sender: TObject);
    procedure ppCalcAcumuladoMensalPrint(Sender: TObject);
  private
    FdVlrRentPeriodo      : Double;
    FsAcumuladoDoUltimoMes : String;

    procedure SetdVlrRentPeriodo(const Value: Double);
  private
    { Private declarations }

    CtrlPeriodo         : TCtrlPeriodo;
    CtrlContab          : TCtrlContab;
    CtrlSPCConsiste     : TCtrlSPCConsiste;

    property dVlrRentPeriodo: Double read FdVlrRentPeriodo write SetdVlrRentPeriodo;

  public

    { Public declarations }
    procedure Progresso(vParam: array of variant);
    //Marcus Oliveira P.23973 0808/2007
    procedure CalculoRentabilidade;


  end;

var
  FrmRentabilidadeContabilMT: TFrmRentabilidadeContabilMT;

implementation
var //Para Imprimir todos no relatório.
ImpTodos: Boolean;


{$R *.DFM}

procedure TFrmRentabilidadeContabilMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize( dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,False );

  CdsExercicio.Data := CtrlPeriodo.ListExercicios( Sistema.IdEmpresa, True );


  CtrlContab := TCtrlContab.Create;
  CtrlContab.InitializeAs( CtrlPeriodo );

  if not CtrlContab.SelecionaParametros( Sistema.IdEmpresa ) Then
    MsgDlg('Não foi possível selecionar os parâmetros contábeis. ' + #13 +
           'Motivo: ' + CtrlContab.MessageInfo,'Erro',mtError,[mbOk],0);


  CtrlSPCConsiste := TCtrlSPCConsiste.Create;
  CtrlSPCConsiste.InitializeAs( CtrlPeriodo );

  //Marcus Oliveira
  cdsRentab.data := CtrlSPCConsiste.AbreCdsRentab;

  cdsSPCConsiste.Data := CtrlSPCConsiste.SelecionaTipoRentConabil( ParamIntegra.Plano );
  cdsSPCConsiste.First;

  // Rodolpho da Silva P: 22202 - 09/05/2006
  CdsPlanoPrev.Data := CtrlSPCConsiste.ListaPlano;
  CdsPatro.Data     := CtrlSPCConsiste.ListaPatro;
  CdsFundacao.Data  := CtrlSPCConsiste.ListaImagem(Sistema.IdEmpresa);
  cdsResult.Data    := CtrlSPCConsiste.AbreCdsResult;

  CtrlSPCConsiste.Progresso           := Progresso;
  pgcPatroPlanoResult.ActivePageIndex := 0;


end;



procedure TFrmRentabilidadeContabilMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.free;
  CtrlContab.free;
  CtrlSPCConsiste.free;
end;


procedure TFrmRentabilidadeContabilMT.bbtnConfirmarClick(Sender: TObject);
var

   sMes,sPlano,sPatro: string;
   iAtivo, iCAtivo: integer;
begin
  inherited;
  // Rodolpho da Silva P: 22202 - 09/05/2006
  CdsResult.Data := CtrlSPCConsiste.AbreCdsResult;

  //Testa os períodos escolhidos
  If ( StrToInt(dblkPeriodoFim.LookupValue) < StrToInt(dblkPeriodo.LookupValue) ) Then
  Begin
    MsgDlg('O período final não pode ser um mês anterior ao período do mês inicial', 'Aviso', mtWarning, [mbOK], 0);
    dblkPeriodoFim.SetFocus;
    Exit;
  End;

  //Testa se foi selecionado o tipo de rentabilidade contábil
  //Marcus Oliveira P. 22024 19/09/2006

  {If Trim ( dblkSpcConsiste.Text ) = ''  Then
  Begin
    MsgDlg('Escolha a rentabilidade contábil', 'Aviso', mtWarning, [mbOK], 0);
    dblkSpcConsiste.SetFocus;
    Exit;
  End;  }

  //Testa se foi escolhido a Patro
  cdsPatro.First;
  while not cdsPatro.EOF do
  begin
    if cdsPatro.FieldByName('MARCA').AsString = 'S' then
    begin
      if Trim(sPatro) = '' Then
        sPatro := trim(IntToStr(cdsPatro.FieldByName('IDPESSOA').AsInteger))
      else
        sPatro := sPatro + ',' + trim(IntToStr(cdsPatro.FieldByName('IDPESSOA').AsInteger));
    end;
    cdsPatro.Next;
  end;

  //Testa se foi escolhido o Plano Previdenciário
  cdsPlanoPrev.First;
  while not cdsPlanoPrev.EOF do
  begin
    if cdsPlanoPrev.FieldByName('MARCA').AsString = 'S' Then
    begin
      if Trim(sPlano) = '' Then
        sPlano := trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger))
      else
        sPlano := sPlano + ',' + trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
    End;
    cdsPlanoPrev.Next;
  End;

  //Marcus Oliveira P. 22024 19/09/2006
//  If Trim ( dblkSpcConsiste.Text ) = ''  Then
//  begin
//     ImpTodos:= True;
//
//     if not CtrlSPCConsiste.ProcessaVariasRentabilidade(StrToInt(dblkExercicio.LookupValue),
//                                                 StrToInt(dblkPeriodo.LookupValue),
//                                                 StrToInt(dblkPeriodoFim.LookupValue),
//                                                 sPlano, sPatro,chkDesconsidera.Checked,
//                                                 cdsResult, dRentPeriodo, Sistema.IdEmpresa) then
//
//        MsgDlg('Houve um erro ao processar a rentabilidade contábil. ' + #13 +
//               'Motivo: ' + CtrlSPCConsiste.MessageInfo,'Erro',mtError,[mbOk],0);
//
//         pgcPatroPlanoResult.Pages[1].TabVisible := True;
//         pgcPatroPlanoResult.ActivePage          := tbsResult;
//         grpPatro.Enabled                        := False;
//         grpPlanoPrev.Enabled                    := False;
//         pnlFundo.Enabled                        := True;
//         bbtnConfirmar.Enabled                   := False;
//         bbtnCancelar.Enabled                    := True;
//         bbtnImprimir.Enabled                    := True;

//  end
//  else
//    begin
//      ImpTodos:= False;

     try

       CdsSpcConsiste.DisableControls;

       CdsSpcConsiste.Filtered := False;
       CdsSpcConsiste.Filter := 'Marca = ''S'' ';
       CdsSpcConsiste.Filtered := True;

       case CdsSpcConsiste.RecordCount of
       0 : begin
             MsgDlg('Pelo menos uma rentabilidade deve ser escolhida', 'Atenção', mtWarning, [mbOk], 0);
             CdsSpcConsiste.Filtered := False;
             pgcPatroPlanoResult.ActivePage := tbRentab;
             exit;
             
           end;

       1 : begin
             //##
             dVlrRentPeriodo := vAcumPeriodo.AsDouble;
             if not CtrlSPCConsiste.ProcessaRentabilidade(StrToInt(dblkExercicio.LookupValue),
                                                          StrToInt(dblkPeriodo.LookupValue),
                                                          StrToInt(dblkPeriodoFim.LookupValue),
                                                          CdsSpcConsiste.FieldbyName('IDSPCCONSISTE').AsInteger,
                                                          sPlano, sPatro,chkDesconsidera.Checked,
                                                          cdsResult,FdVlrRentPeriodo, Sistema.IdEmpresa) then

                MsgDlg('Houve um erro ao processar a rentabilidade contábil. ' + #13 +
                       'Motivo: ' + CtrlSPCConsiste.MessageInfo,'Erro',mtError,[mbOk],0);

             CdsSpcConsiste.Filtered := False;
           end;

       else begin
             CdsSpcConsiste.first;
             while not CdsSpcConsiste.Eof do
             begin      //###
               dVlrRentPeriodo := vAcumPeriodo.AsDouble;
               if not CtrlSPCConsiste.ProcessaRentabilidade(StrToInt(dblkExercicio.LookupValue),
                                                            StrToInt(dblkPeriodo.LookupValue),
                                                            StrToInt(dblkPeriodoFim.LookupValue),
                                                            CdsSpcConsiste.FieldbyName('IDSPCCONSISTE').AsInteger,
                                                            sPlano, sPatro,chkDesconsidera.Checked,
                                                            cdsResult, FdVlrRentPeriodo, Sistema.IdEmpresa) then

                  MsgDlg('Houve um erro ao processar a rentabilidade contábil. ' + #13 +
                         'Motivo: ' + CtrlSPCConsiste.MessageInfo,'Erro',mtError,[mbOk],0);


               CdsSpcConsiste.Next;
             end;

             CdsSpcConsiste.Filtered := False;

        end;
        end;

     finally
       CdsSpcConsiste.EnableControls;

     end;


        //Marcus Oliveira p.22024 18/04/2007
//      pgcPatroPlanoResult.Pages[1].TabVisible := True;
//      pgcPatroPlanoResult.ActivePage          := tbsResult;
      grpPatro.Enabled                        := False;
      grpPlanoPrev.Enabled                    := False;
      pnlFundo.Enabled                        := True;
      bbtnConfirmar.Enabled                   := False;
      bbtnCancelar.Enabled                    := True;
      bbtnImprimir.Enabled                    := True;
//    end;

      //Faz o Clone para usar os valores no Sumário - Marcus Oliveira
      CalculoRentabilidade;

     //Marcus Oliveira disparar logo o imprimir
     bbtnImprimir.Click;

end;

procedure TFrmRentabilidadeContabilMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblkPeriodo.LookupValue := '';
  CdsPeriodo.Close;
  if trim( dblkExercicio.Text ) <> '' then
  begin
    dblkPeriodo.Enabled := True;
    CdsPeriodo.Data     := CtrlPeriodo.ListPeriodo( Sistema.IdEmpresa, tbpTodos,
                                                    StrToInt(trim(dblkExercicio.Text)),0);

    dblkPeriodoFim.Enabled := True;
    CdsPeriodoFim.Data  := CtrlPeriodo.ListPeriodo( Sistema.IdEmpresa, tbpTodos,
                                                    StrToInt(trim(dblkExercicio.Text)),0);
  end
  else
  Begin
    dblkPeriodo.Enabled    := False;
    dblkPeriodoFim.Enabled := False;
  end;
end;


procedure TFrmRentabilidadeContabilMT.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  TFrmPreview.CreateModalPreview( Application, ppReport1, 'Rentabilidade Contábil - Relatório');
end;


procedure TFrmRentabilidadeContabilMT.ppReport1BeforePrint(
  Sender: TObject);
var
  sTexto: string;
begin
  inherited;

  try
     CdsPlanoPrev.DisableControls;
     CdsPatro.DisableControls;

     // Plano
     CdsPlanoPrev.First;
     while not CdsPlanoPrev.Eof do
     begin
        if CdsPlanoPrev.FieldByName('MARCA').AsString = 'S' then
        begin
            if Trim(sTexto) <> '' then
               sTexto := sTexto + ',  ' + CdsPlanoPrev.FieldByName('NOME').AsString
            else
               sTexto := CdsPlanoPrev.FieldByName('NOME').AsString;
        end;

        CdsPlanoPrev.Next;
     end;

     if Trim(sTexto) <> '' then
        lbPlano.Caption := sTexto
     else
        lbPlano.Caption := 'Todos';


     // Patrocinadora
     sTexto := '';
     CdsPatro.First;
     while not CdsPatro.Eof do
     begin
        if CdsPatro.FieldByName('MARCA').AsString = 'S' then
        begin
            if Trim(sTexto) <> '' then
               sTexto := sTexto + ',  ' + CdsPatro.FieldByName('NOME').AsString
            else
               sTexto := CdsPatro.FieldByName('NOME').AsString;
        end;

        CdsPatro.Next;
     end;

     if Trim(sTexto) <> '' then
        lbPatro.Caption := sTexto
     else
        lbPatro.Caption := 'Todos';

     CdsPlanoPrev.First;
     CdsPatro.First;

  finally
     CdsPlanoPrev.EnableControls;
     CdsPatro.EnableControls;

  end;

end;




procedure TFrmRentabilidadeContabilMT.ppLabel28Print(Sender: TObject);
begin
  inherited;
{  if ImpTodos then
     ppLabel28.Text := 'Todas'
  else
     ppLabel28.Text := dblkSpcConsiste.Text;
}
end;




procedure TFrmRentabilidadeContabilMT.ppLabel29Print(Sender: TObject);
begin
  inherited;
  ppLabel29.Text := dblkExercicio.LookupValue;
end;




procedure TFrmRentabilidadeContabilMT.ppLabel33Print(Sender: TObject);
begin
  inherited;
  ppLabel33.Text := dblkPeriodo.Text;
end;




procedure TFrmRentabilidadeContabilMT.ppLabel42Print(Sender: TObject);
begin
  inherited;
  ppLabel42.Text := dblkPeriodoFim.Text;
end;




procedure TFrmRentabilidadeContabilMT.ppLabel54Print(Sender: TObject);
begin
  inherited;
  pplabel54.Text := Sistema.NomeEmpresa;
end;




procedure TFrmRentabilidadeContabilMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsResult.Close;
  pgcPatroPlanoResult.Pages[1].TabVisible := False;
  pgcPatroPlanoResult.ActivePage          := tbsPlanoPatro;
  bbtnConfirmar.Enabled                   := True;
  bbtnCancelar.Enabled                    := False;
  bbtnImprimir.Enabled                    := False;
  grpPatro.Enabled                        := True;
  grpPlanoPrev.Enabled                    := True;

  //Marcus Oliveira P.26384 19/09/2007
  cdsRentab.EmptyDataSet;

end;




procedure TFrmRentabilidadeContabilMT.CdsResultAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TFloatField(cdsResult.FieldByName('DATA')).DisplayFormat    := 'dd/mm/yyyy';
  TFloatField(cdsResult.FieldByName('ATIVO')).DisplayFormat   := '#,##0.00';
  TFloatField(cdsResult.FieldByName('PASSIVO')).DisplayFormat := '#,##0.00';
  TFloatField(cdsResult.FieldByName('LIQUIDO')).DisplayFormat := '#,##0.00';
  TFloatField(cdsResult.FieldByName('RECEITA')).DisplayFormat := '#,##0.00';
  TFloatField(cdsResult.FieldByName('DESPESA')).DisplayFormat := '#,##0.00';
  TFloatField(cdsResult.FieldByName('MES')).DisplayFormat     := '#,##0.00';
  TFloatField(cdsResult.FieldByName('DIA')).DisplayFormat     := '#,##0.00';
  TFloatField(cdsResult.FieldByName('RENTDIA')).DisplayFormat := '#.##000';
  TFloatField(cdsResult.FieldByName('RENTMENSAL')).DisplayFormat := '#.##000';
  TFloatField(cdsResult.FieldByName('RENTPERIODO')).DisplayFormat := '#.##000';

end;

procedure TFrmRentabilidadeContabilMT.cdsPlanoPrevAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TStringField(DataSet.FieldByName('NOME')).ReadOnly := True;
end;



procedure TFrmRentabilidadeContabilMT.dbgrPatroCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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


procedure TFrmRentabilidadeContabilMT.dbgrPatroTopRowChanged(
  Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TFrmRentabilidadeContabilMT.Progresso(vParam: array of variant);
// 0 (1-Mostra,2-Anda,3-Esconde)
// 1 Legenda
// 2 Minimo
// 3 Posicao
// 4 Máximo
//
begin
   case vParam[0] of
      1: begin
            frmProgresso.MostraFormProgresso(vParam[1],False,False,True,vParam[2],vParam[3]);
         end;

      2: begin
            frmProgresso.AndaFormProgresso(vParam[3],vParam[4]);
         end;

      3: begin
            frmProgresso.EscondeFormProgresso;
         end;      
   end;

   Application.ProcessMessages;
   Repaint;
end;




procedure TFrmRentabilidadeContabilMT.lbSistemaPrint(Sender: TObject);
begin
  inherited;
  lbSistema.Caption := Sistema.NomeAplicativo;
end;




procedure TFrmRentabilidadeContabilMT.lbObsPrint(Sender: TObject);
begin
  inherited;
  if chkDesconsidera.Checked then
     lbObs.Caption := 'Contas de encerramento de resultado desconsideradas'
  else
     lbObs.Caption := '';   
end;




procedure TFrmRentabilidadeContabilMT.shpCorZebraPrint(Sender: TObject);
begin
  inherited;
  if shpCorZebra.Brush.Color = clWhite then
     shpCorZebra.Brush.Color := $00E2E2E2
  else
     shpCorZebra.Brush.Color := clWhite;
end;

procedure TFrmRentabilidadeContabilMT.dbgridRentabCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TFrmRentabilidadeContabilMT.CalculoRentabilidade;
var
dDia, dLiqdiaAnt : double;

begin

  CdsResult.First;
  CdsResult.Next;

  while not CdsResult.eof do
  begin
    dDia       := CdsResult.FieldByName('DIA').AsFloat;

    CdsResult.Prior;

    dLiqdiaAnt := CdsResult.FieldByName('LIQUIDO').AsFloat;

    CdsResult.Next;
    CdsResult.edit;

    if dLiqdiaAnt <> 0 then

       CdsResult.FieldByName('RENTDIA').AsFloat := ( (dDia / dLiqdiaAnt )+1 )
    else
       CdsResult.FieldByName('RENTDIA').AsFloat := 1;

    CdsResult.post;
    CdsResult.Next;

  end;

end;

procedure TFrmRentabilidadeContabilMT.SetdVlrRentPeriodo(
  const Value: Double);
begin
  FdVlrRentPeriodo := Value;
end;

procedure TFrmRentabilidadeContabilMT.dbRentMensalPrint(Sender: TObject);
begin
  inherited;
 //   CdsResult.Edit;
//    CdsResult.FieldByName('RENTMENSAL').AsFloat := ( (vAcumMensal.Value -1)*100);
//    CdsResult.Post;
end;

procedure TFrmRentabilidadeContabilMT.dbRentPerPrint(Sender: TObject);
begin
  inherited;
    CdsResult.Edit;
    CdsResult.FieldByName('RENTPERIODO').AsFloat := ( (vAcumPeriodo.Value -1)*100);
    CdsResult.Post;

end;

procedure TFrmRentabilidadeContabilMT.lbVlrRentDiaPrint(Sender: TObject);
begin

  inherited;

  //Seta quando inicia o periodo
  //Marcus Oliveira Data: 21/09/2007 Pendência: 26384

  if CtrlSPCConsiste.EUltimoDiaMes(CdsResult.fieldbyname('DATA').AsDateTime) then
  begin
     CdsResult.edit;
     CdsResult.FieldByName('RENTMENSAL').AsFloat := ( ( CdsResult.FieldByName('RENTDIA').AsFloat * vAcumMensal.Value) -1 ) * 100;
     CdsResult.post;
     vAcumMensal.Value := 1
  end
  else
    vAcumMensal.Value  := ( CdsResult.FieldByName('RENTDIA').AsFloat * vAcumMensal.Value);

  if vAcumPeriodo.Value = 0 then
     vAcumPeriodo.Value := 1
  else //Marcus Oliveira Data: 05/09/2007 Pendência: 26237
     vAcumPeriodo.Value := ( cdsResult.FieldByName('RENTDIA').AsFloat * vAcumPeriodo.Value);

end;

procedure TFrmRentabilidadeContabilMT.ppGroupFooterBand1AfterPrint(
  Sender: TObject);
begin
  inherited;

  vAcumPeriodo.Value := 0;
  //Marcus Oliveira Data: 05/09/2007 Pendência: 26237
  //Só adiciona a rentabilidade quando ela não existir, pra não correr risco de navegação, repetila. Só pega a ultima linha do mes.
  if not ( cdsRentab.Locate('DESCRICAO', CdsResult.fieldbyname('DESCRICAO').AsString, [LoCaseInsensitive]) ) then
  begin
    cdsRentab.Append;
    cdsRentab.FieldByName('DESCRICAO').AsString  := CdsResult.fieldbyName('DESCRICAO').AsString;
  end else
    cdsRentab.Edit;

  cdsRentab.fieldbyname('LIQUIDO').AsFloat     := CdsResult.fieldbyname('LIQUIDO').AsFloat;
  cdsRentab.fieldbyname('ULT_MES').AsString    := FsAcumuladoDoUltimoMes;
  cdsRentab.fieldbyname('MES').AsFloat         := CdsResult.fieldbyname('MES').AsFloat;
  cdsRentab.fieldbyname('RENTMENSAL').AsFloat  := CdsResult.fieldbyname('RENTMENSAL').AsFloat;
  cdsRentab.fieldbyname('RENTPERIODO').AsFloat := CdsResult.fieldbyname('RENTPERIODO').AsFloat;

  cdsRentab.Post;

end;

procedure TFrmRentabilidadeContabilMT.ppSubReport1Print(Sender: TObject);
begin
  inherited;
  cdsRentab.IndexFieldNames := 'DESCRICAO' ;

end;

procedure TFrmRentabilidadeContabilMT.ppGroupFooterBand2AfterPrint(
  Sender: TObject);
begin
  inherited;
  vAcumMensal.Value := 0;
end;

procedure TFrmRentabilidadeContabilMT.ppCalcAcumuladoMensalPrint( Sender: TObject );
begin
  inherited;

  FsAcumuladoDoUltimoMes := ppCalcAcumuladoMensal.Text;

end;

end.

