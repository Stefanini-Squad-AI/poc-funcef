
unit FRelDirfIndividual;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 155071 KTN 1471869
Responsável : Vinicius Eduardo N. Maciel
Data        : 10/01/2011
Descrição   : Criação da tela.
-------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Mask, DBCtrls, DBLookup, Db,
  DBClient, uCMClientDataSet,uCtrlPessoa,uCtrlPadroes, uValidaDoc, uCtrlDirfIndividual,
  wwdblook,fPreview, ppDB, ppDBPipe, ppDBBDE, ppParameter, ppModule,
  daDataModule, ppVar, ppBands, ppStrtch, ppMemo, ppCtrls, jpeg, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBTables, Wwquery,
  wwdbedit, Wwdotdot, Wwdbcomb, FPai;

type
  TFrmRelDirfIndividual = class(TfrmOkCancelar)
    pnlCentral: TPanel;
    Label1: TLabel;
    pnlSuperior: TPanel;
    pnlEsquerdo: TPanel;
    pnlDireito: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ListView1: TListView;
    BtnAdd: TButton;
    btnDel: TButton;
    Ds: TDataSource;
    DsAno: TDataSource;
    dblcAno: TwwDBLookupCombo;
    btImprimir: TBitBtn;
    rptRelatorioIndividual: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    daDataModule1: TdaDataModule;
    ppParameterList1: TppParameterList;
    ppRelatorioIndividual: TppBDEPipeline;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    qry: TwwQuery;
    qryCPF: TStringField;
    qryNOME: TStringField;
    qryMESCOBRANCA: TStringField;
    qryMES: TStringField;
    qryNATUREZA: TStringField;
    qryVALOR_1: TFloatField;
    qryVALOR_2: TFloatField;
    qryVALOR_3: TFloatField;
    qryVALOR_4: TFloatField;
    qryVALOR_5: TFloatField;
    qryVALOR_6: TFloatField;
    qryVALOR_7: TFloatField;
    qryVALOR_8: TFloatField;
    qryVALOR_9: TFloatField;
    qryVALOR_10: TStringField;
    ppRelatorioIndividualppField1: TppField;
    qry2: TwwQuery;
    qry2NOME: TStringField;
    lblRendTributJan: TppLabel;
    lblRendTributFev: TppLabel;
    lblRendTributMar: TppLabel;
    lblRendTributAbr: TppLabel;
    lblRendTributMai: TppLabel;
    lblRendTributJun: TppLabel;
    lblRendTributAgo: TppLabel;
    lblRendTributJul: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    Jul: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    Ago: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel9: TppLabel;
    lblRendTributSet: TppLabel;
    lblRendTributOut: TppLabel;
    lblRendTributNov: TppLabel;
    lblRendTributDez: TppLabel;
    lblPrevOficialJan: TppLabel;
    lblPrevOficialFev: TppLabel;
    lblPrevOficialmar: TppLabel;
    lblPrevOficialAbr: TppLabel;
    lblPrevOficialMai: TppLabel;
    lblPrevOficialJun: TppLabel;
    lblPrevOficialAgo: TppLabel;
    lblPrevOficialJul: TppLabel;
    lblPrevOficialSet: TppLabel;
    lblPrevOficialOut: TppLabel;
    lblPrevOficialNov: TppLabel;
    lblPrevOficialDez: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    titulo: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    lblPrevPrivJan: TppLabel;
    lblPrevPrivFev: TppLabel;
    lblPrevPrivMar: TppLabel;
    lblPrevPrivAbr: TppLabel;
    lblPrevPrivMai: TppLabel;
    lblPrevPrivJun: TppLabel;
    lblPrevPrivAgo: TppLabel;
    lblPrevPrivJul: TppLabel;
    lblPrevPrivSet: TppLabel;
    lblPrevPrivOut: TppLabel;
    lblPrevPrivNov: TppLabel;
    lblPrevPrivDez: TppLabel;
    lblDependentesJan: TppLabel;
    lblDependentesFev: TppLabel;
    lblDependentesMar: TppLabel;
    lblDependentesAbr: TppLabel;
    lblDependentesMai: TppLabel;
    lblDependentesJun: TppLabel;
    lblDependentesAgo: TppLabel;
    lblDependentesJul: TppLabel;
    lblDependentesSet: TppLabel;
    lblDependentesOut: TppLabel;
    lblDependentesNov: TppLabel;
    lblDependentesDez: TppLabel;
    lblPnsAlimJan: TppLabel;
    lblPnsAlimFev: TppLabel;
    lblPnsAlimMar: TppLabel;
    lblPnsAlimAbr: TppLabel;
    lblPnsAlimMai: TppLabel;
    lblPnsAlimJun: TppLabel;
    lblPnsAlimAgo: TppLabel;
    lblPnsAlimJul: TppLabel;
    lblPnsAlimSet: TppLabel;
    lblPnsAlimOut: TppLabel;
    lblPnsAlimNov: TppLabel;
    lblPnsAlimDez: TppLabel;
    lblImpsRetJan: TppLabel;
    lblImpsRetFev: TppLabel;
    lblImpsRetMar: TppLabel;
    lblImpsRetAbr: TppLabel;
    lblImpsRetMai: TppLabel;
    lblImpsRetJun: TppLabel;
    lblImpsRetAgo: TppLabel;
    lblImpsRetJul: TppLabel;
    lblImpsRetSet: TppLabel;
    lblImpsRetOut: TppLabel;
    lblImpsRetNov: TppLabel;
    lblImpsRetDez: TppLabel;
    lblParcela65Jan: TppLabel;
    lblParcela65Fev: TppLabel;
    lblParcela65Mar: TppLabel;
    lblParcela65Abr: TppLabel;
    lblParcela65Mai: TppLabel;
    lblParcela65Jun: TppLabel;
    lblParcela65Ago: TppLabel;
    lblParcela65Jul: TppLabel;
    lblParcela65Set: TppLabel;
    lblParcela65Out: TppLabel;
    lblParcela65Nov: TppLabel;
    lblParcela65Dez: TppLabel;
    lblAjudaCustoJan: TppLabel;
    lblAjudaCustoFev: TppLabel;
    lblAjudaCustoMar: TppLabel;
    lblAjudaCustoAbr: TppLabel;
    lblAjudaCustoMai: TppLabel;
    lblAjudaCustoJun: TppLabel;
    lblAjudaCustoAgo: TppLabel;
    lblAjudaCustoJul: TppLabel;
    lblAjudaCustoSet: TppLabel;
    lblAjudaCustoOut: TppLabel;
    lblAjudaCustoNov: TppLabel;
    lblAjudaCustoDez: TppLabel;
    lblIndendRescJan: TppLabel;
    lblIndendRescFev: TppLabel;
    lblIndendRescMar: TppLabel;
    lblIndendRescAbr: TppLabel;
    lblIndendRescMai: TppLabel;
    lblIndendRescJun: TppLabel;
    lblIndendRescAgo: TppLabel;
    lblIndendRescJul: TppLabel;
    lblIndendRescSet: TppLabel;
    lblIndendRescOut: TppLabel;
    lblIndendRescNov: TppLabel;
    lblIndendRescDez: TppLabel;
    lblAbonoJan: TppLabel;
    lblAbonoFev: TppLabel;
    lblAbonoMar: TppLabel;
    lblAbonoAbr: TppLabel;
    lblAbonoMai: TppLabel;
    lblAbonoJun: TppLabel;
    lblAbonoAgo: TppLabel;
    lblAbonoJul: TppLabel;
    lblAbonoSet: TppLabel;
    lblAbonoOut: TppLabel;
    lblAbonoNov: TppLabel;
    lblAbonoDez: TppLabel;
    lblRendTributTot: TppLabel;
    lblRendTribut13: TppLabel;
    lblPrevOficialTot: TppLabel;
    lblPrevOficial13: TppLabel;
    lblPrevPrivTot: TppLabel;
    lblPrevPriv13: TppLabel;
    lblDependentesTot: TppLabel;
    lblDependentes13: TppLabel;
    lblPnsAlimTot: TppLabel;
    lblPnsAlim13: TppLabel;
    lblImpsRetTot: TppLabel;
    lblImpsRet13: TppLabel;
    lblParcela65Tot: TppLabel;
    lblParcela6513: TppLabel;
    lblAjudaCustoTot: TppLabel;
    lblAjudaCusto13: TppLabel;
    lblIndendRescTot: TppLabel;
    lblIndendResc13: TppLabel;
    lblAbonoTot: TppLabel;
    lblAbono13: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    qry2IDPESSOA: TFloatField;
    qry2NATUREZA: TStringField;
    qry2NUMDOCUMENTO: TStringField;
    CdsLookupAno: TCMClientDataSet;
    Cds: TCMClientDataSet;
    pplLbFndCor1: TppLabel;
    pplLbFndCor2: TppLabel;
    pplLbFndCor3: TppLabel;
    pplLbFndCor4: TppLabel;
    pplLbFndCor5: TppLabel;
    pplLbFndCor7: TppLabel;
    pplLbFndCor6: TppLabel;
    ppDBText1: TppDBText;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppRelatorioIndividualppField2: TppField;
    pplAno: TppLabel;
    CMValidaDoc1: TCMValidaDoc;
    Label5: TLabel;
    Panel1: TPanel;
    edCPF: TMaskEdit;
    ppLabel31: TppLabel;
    ppRelatorioIndividualppField3: TppField;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppImage1: TppImage;
    ppRelatorioIndividualppField4: TppField;
    ppLabel21: TppLabel;
    ppDBText3: TppDBText;
    btGerarArquivo: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure defineCampos;
    function retornaMes(sMesCobranca : String) : String;
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure limpaCampos(sMes : String);
    procedure limpaCamposRelatorio;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btGerarArquivoClick(Sender: TObject);
  private
    listaCPF : TStringList;
    CtrlDirfIndividual : TCtrlDirfIndividual;
    sAno : string;
    procedure atualizaListView;
    procedure ajusteExcel;
    function ajustaMascara(sNumCpf : String) : String;
    function verificaCriterios : Boolean;
  public
   function ValidaCPF : boolean;
  end;

var
  FrmRelDirfIndividual: TFrmRelDirfIndividual;

implementation

uses uSistema, uMensErro, uDataBase, DBaseDados, fOpcoesExportacaoDirf;

{$R *.DFM}

procedure TFrmRelDirfIndividual.FormCreate(Sender: TObject);
var
sANo : String;
begin
  inherited;
    sAno := FormatDateTime('yyyy',now);
    listaCPF := TStringList.Create;
    CtrlDirfIndividual :=  TCtrlDirfIndividual.Create;
    CtrlDirfIndividual.InitializeAs( Padroes );
    CdsLookupAno.data := CtrlDirfIndividual.carregaAno;
    dblcAno.LookupValue := sAno;
end;

procedure TFrmRelDirfIndividual.BtnAddClick(Sender: TObject);
begin
  inherited;
  if validaCPF then
  begin
      listaCPF.add(edCPF.text);
      atualizaListView;
  end;
end;

procedure TFrmRelDirfIndividual.btnDelClick(Sender: TObject);
var  i : integer;
begin
  if (ListView1.Selected <> nil) then
  begin
      listaCPF.Delete(ListView1.Selected.Index);
      atualizaListView;
  end;
end;

function TFrmRelDirfIndividual.ValidaCPF: boolean;
var
   i, teste : integer;
begin
result := false;
   if {(edCPF.modified) and} (edCPF.text <> '') then
   begin
      CMValidaDoc1.NumDocumento := edCPF.text;
      if CMValidaDoc1.DocumentoValido then
      begin
           if CtrlDirfIndividual.verificaEmpregado(edCPF.text) then
           begin
           teste := listaCPF.IndexOf(edCPF.text);
                //if listaCPF.find(edCPF.text,i) then
                if listaCPF.IndexOf(edCPF.text) <> -1 then
                ShowMessage('Empregado já selecionado !')
                else
                result := true;
           end
           else
           ShowMessage('Não foi encontrado empregado cadastrado com esse número de CPF.');
      end
      else
          ShowMessage('Número de documento inválido.');
   end;

end;

procedure TFrmRelDirfIndividual.atualizaListView;
var
   lista : TListItem;
   i : Integer;
begin
    ListView1.items.Clear;
    if listaCPF.Count >= 1 then
        for i := 0 to listaCPF.Count -1 Do
        begin
          lista := ListView1.items.add;
          lista.Caption := ajustaMascara(listaCPF[i])+' / '+CtrlDirfIndividual.retornaNome(listaCPF[i]);
        end;
end;

procedure TFrmRelDirfIndividual.btImprimirClick(Sender: TObject);
begin
  inherited;
  if verificaCriterios then
  TFrmPreview.CreateModalPreview(Self,rptRelatorioIndividual,rptRelatorioIndividual.PrinterSetup.DocumentName);
end;

procedure TFrmRelDirfIndividual.defineCampos;
var
    sMes : String;
begin
     sMes := retornaMes(qry.FieldByname('MESCOBRANCA').asString);
     qry.FieldByname('VALOR_1').EditMask := '###.##0,00;0';
     if ((qry.FieldByname('VALOR_1').asString <>'') and  (qry.FieldByname('VALOR_1').asString<> '0')) then
     // TppLabel(Self.FindComponent('lblRendTribut'+sMes)).Caption := qry.FieldByname('VALOR_1').asString
     TppLabel(Self.FindComponent('lblRendTribut'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_1').asFloat])
     else
     TppLabel(Self.FindComponent('lblRendTribut'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_2').asString <>'') and  (qry.FieldByname('VALOR_2').asString <> '0')) then
     //TppLabel(Self.FindComponent('lblPrevOficial'+sMes)).Caption := qry.FieldByname('VALOR_2').asString
     TppLabel(Self.FindComponent('lblPrevOficial'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_2').asFloat])
     else
     TppLabel(Self.FindComponent('lblPrevOficial'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_3').asString <>'') and  (qry.FieldByname('VALOR_3').asString <> '0')) then
     //TppLabel(Self.FindComponent('lblPrevPriv'+sMes)).Caption := qry.FieldByname('VALOR_3').asString
     TppLabel(Self.FindComponent('lblPrevPriv'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_3').asFloat])
     else
     TppLabel(Self.FindComponent('lblPrevPriv'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_4').asString <>'') and  (qry.FieldByname('VALOR_4').asString <> '0')) then
     //TppLabel(Self.FindComponent('lblDependentes'+sMes)).Caption := qry.FieldByname('VALOR_4').asString
     TppLabel(Self.FindComponent('lblDependentes'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_4').asFloat])
     else
     TppLabel(Self.FindComponent('lblDependentes'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_5').asString <>'') and  (qry.FieldByname('VALOR_5').asString <> '0')) then
     //TppLabel(Self.FindComponent('lblPnsAlim'+sMes)).Caption := qry.FieldByname('VALOR_5').asString
     TppLabel(Self.FindComponent('lblPnsAlim'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_5').asFloat])
     else
     TppLabel(Self.FindComponent('lblPnsAlim'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_6').asString <>'') and  (qry.FieldByname('VALOR_6').asString <> '0')) then
     //TppLabel(Self.FindComponent('lblImpsRet'+sMes)).Caption := qry.FieldByname('VALOR_6').asString
     TppLabel(Self.FindComponent('lblImpsRet'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_6').asFloat])
     else
     TppLabel(Self.FindComponent('lblImpsRet'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_7').asString <>'') and  (qry.FieldByname('VALOR_7').asString <> '0')) then
     //TppLabel(Self.FindComponent('lblParcela65'+sMes)).Caption := qry.FieldByname('VALOR_7').asString
     TppLabel(Self.FindComponent('lblParcela65'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_7').asFloat])
     else
     TppLabel(Self.FindComponent('lblParcela65'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_8').asString <>'') and  (qry.FieldByname('VALOR_8').asString <> '0')) then
     //TppLabel(Self.FindComponent('lblAjudaCusto'+sMes)).Caption := qry.FieldByname('VALOR_8').asString
     TppLabel(Self.FindComponent('lblAjudaCusto'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_8').asFloat])
     else
     TppLabel(Self.FindComponent('lblAjudaCusto'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_9').asString <>'') and (qry.FieldByname('VALOR_9').asString <> '0')) then
     //TppLabel(Self.FindComponent('lblIndendResc'+sMes)).Caption := qry.FieldByname('VALOR_9').asString
     TppLabel(Self.FindComponent('lblIndendResc'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_9').asFloat])
     else
     TppLabel(Self.FindComponent('lblIndendResc'+sMes)).Caption := '-';

     if ((qry.FieldByname('VALOR_10').asString <>'') and  (qry.FieldByname('VALOR_10').asString <> '0')) then
     TppLabel(Self.FindComponent('lblAbono'+sMes)).Caption := qry.FieldByname('VALOR_10').asString
    // TppLabel(Self.FindComponent('lblAbono'+sMes)).Caption := Format('%n', [qry.FieldByname('VALOR_10').asFloat])
     else
     TppLabel(Self.FindComponent('lblAbono'+sMes)).Caption := '-';

end;



function TFrmRelDirfIndividual.retornaMes(sMesCobranca: String): String;
begin
    if(sMesCobranca = sAno+'/01') then
    result := 'Jan';
    if(sMesCobranca = sAno+'/02') then
    result := 'Fev';
    if(sMesCobranca = sAno+'/03') then
    result := 'Mar';
    if(sMesCobranca = sAno+'/04') then
    result := 'Abr';
    if(sMesCobranca = sAno+'/05') then
    result := 'Mai';
    if(sMesCobranca = sAno+'/06') then
    result := 'Jun';
    if(sMesCobranca = sAno+'/07') then
    result := 'Jul';
    if(sMesCobranca = sAno+'/08') then
    result := 'Ago';
    if(sMesCobranca = sAno+'/09') then
    result := 'Set';
    if(sMesCobranca = sAno+'/10') then
    result := 'Out';
    if(sMesCobranca = sAno+'/11') then
    result := 'Nov';
    if(sMesCobranca = sAno+'/12') then
    result := 'Dez';
    if(sMesCobranca = 'TOTAL') then
    result := 'TOT';
    if(sMesCobranca = sAno+'/13') then
    result := '13';
end;

procedure TFrmRelDirfIndividual.ppDetailBand4BeforePrint(Sender: TObject);
var
   sCpf : String;
begin
  inherited;
    qry.close;
    sCPF := qry2.FieldByName('NUMDOCUMENTO').asString;
    qry.paramByName('pIdPessoa').asInteger := CtrlDirfIndividual.retornaIDPessoa(sCpf,sAno+'/01',sAno+'/12',qry2.FieldByName('NATUREZA').asString);
    qry.paramByName('pInicio').asString := sAno+'/01';
    qry.paramByName('pFinal').asString := sAno+'/12';
    qry.paramByName('pDt13').asString := sAno+'/13';
    qry.paramByName('pDt14').asString := sAno+'/14';

    qry.open;
    qry.First;
    limpaCamposRelatorio;
    while not qry.eof do
    begin
       defineCampos;
       qry.next;
    end;

end;

procedure TFrmRelDirfIndividual.limpaCampos(sMes : String);
begin
     TppLabel(Self.FindComponent('lblRendTribut'+sMes)).Caption :=  '-';
     TppLabel(Self.FindComponent('lblPrevOficial'+sMes)).Caption :=  '-';
     TppLabel(Self.FindComponent('lblPrevPriv'+sMes)).Caption :=  '-';
     TppLabel(Self.FindComponent('lblDependentes'+sMes)).Caption := '-';
     TppLabel(Self.FindComponent('lblDependentes'+sMes)).Caption := '-';
     TppLabel(Self.FindComponent('lblPnsAlim'+sMes)).Caption :=  '-';
     TppLabel(Self.FindComponent('lblImpsRet'+sMes)).Caption :=  '-';
     TppLabel(Self.FindComponent('lblParcela65'+sMes)).Caption :=  '-';
     TppLabel(Self.FindComponent('lblAjudaCusto'+sMes)).Caption :=  '-';
     TppLabel(Self.FindComponent('lblIndendResc'+sMes)).Caption := '-';
     TppLabel(Self.FindComponent('lblAbono'+sMes)).Caption :=  '-';

end;

procedure TFrmRelDirfIndividual.limpaCamposRelatorio;
begin
    limpaCampos('Jan');
    limpaCampos('Fev');
    limpaCampos('Mar');
    limpaCampos('Abr');
    limpaCampos('Mai');
    limpaCampos('Jun');
    limpaCampos('Jul');
    limpaCampos('Ago');
    limpaCampos('Set');
    limpaCampos('Out');
    limpaCampos('Nov');
    limpaCampos('Dez');
    limpaCampos('TOT');
    limpaCampos('13');
end;

procedure TFrmRelDirfIndividual.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edCPF.text := '';
  listaCPF.Clear;
  atualizaListView;
end;

function TFrmRelDirfIndividual.ajustaMascara(sNumCpf: String): String;
var
sNovoNumero : String;
begin
sNovoNumero :=  copy(sNumCpf,1,3) +
                '.' + copy(sNumCpf,4,3) +
                '.' + copy(sNumCpf,7,3) +
                '-' + copy(sNumCpf,10,2);
result := sNovoNumero;
end;

//O procedimento abaixo foi elaborado para corrigir as quebras de linha do Excel.
procedure TFrmRelDirfIndividual.ajusteExcel;
begin
//Faz os ajuste que eu preciso
pplLbFndCor1.Visible := false;
pplLbFndCor2.Visible := false;
pplLbFndCor3.Visible := false;
pplLbFndCor4.Visible := false;
pplLbFndCor5.Visible := false;
pplLbFndCor6.Visible := false;
pplLbFndCor7.Visible := false;
//Cria a tela para exportação do arquivo
Application.CreateForm(TfrmOpcoesExportacaoDirf,frmOpcoesExportacaoDirf);
frmOpcoesExportacaoDirf.carregaRelatorio(rptRelatorioIndividual);
frmOpcoesExportacaoDirf.showModal;
//Desfaz os ajustes
pplLbFndCor1.Visible := true;
pplLbFndCor2.Visible := true;
pplLbFndCor3.Visible := true;
pplLbFndCor4.Visible := true;
pplLbFndCor5.Visible := true;
pplLbFndCor6.Visible := true;
pplLbFndCor7.Visible := true;
rptRelatorioIndividual.allowPrintToArchive := true;
rptRelatorioIndividual.ShowAutoSearchDialog := false;
rptRelatorioIndividual.ShowCancelDialog := true;
rptRelatorioIndividual.ShowPrintDialog := true;
end;

function TFrmRelDirfIndividual.verificaCriterios: Boolean;
begin
  result := false;
  if listaCPF.Count > 0 then
  begin
      sAno := dblcAno.lookupvalue;
      pplAno.Caption := sAno;
      qry2.close;
      qry2.sql.Clear;
      qry2.sql.add(CtrlDirfIndividual.carregaPessoa(listaCPF,sAno));
      qry2.open;
      if (qry2.recordCount > 0) then
      result := true
      else
      ShowMessage('Não há movimento para os critérios informados.');
  end
  else
      ShowMessage('Nenhum Empregado selecionado.');
end;

procedure TFrmRelDirfIndividual.btGerarArquivoClick(Sender: TObject);
begin
  if verificaCriterios then
  ajusteExcel;
end;

end.
