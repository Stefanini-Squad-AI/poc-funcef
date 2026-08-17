unit FMapaPrevi;
// *****************************************************************************
// Autor(a)    : Higor Nayde
// Data        : 07/05/2014
// Pendência   : SOL 231507 ppm 374481
// Alteração   : Trocar o insert pelo Append.
// *****************************************************************************
// *****************************************************************************
// Autor(a)    : Higor Nayde
// Data        : 06/05/2014
// Pendência   : SOL 231453 ppm 231453
// Alteração   : Comentar o SaveToFile.
// *****************************************************************************

// *****************************************************************************
// Autor(a)    : Higor Nayde
// Data        : 05/05/2014
// Pendência   : SOL 84337 KTN 525168
// Alteração   : criação da funcionalidade.
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Buttons, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, ExtCtrls, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db,
  Wwdatsrc, DBClient, wwclient, DBTables, Wwquery,FTelaAut, MontaSelect,
  uCMClientDataSet, uCmSqlParams, Grids, DBGrids, ppModule, raCodMod, ppVar;

type
  TfrmMapaPrevic = class(TfrmSairAjuda)
    grp_demoEs: TGroupBox;
    cb_ana: TCheckBox;
    cb_con1: TCheckBox;
    grp_ano1: TGroupBox;
    ed_ano1: TEdit;
    grp1: TGroupBox;
    cb_semestre: TComboBox;
    grp_plano: TGroupBox;
    cb_reg: TCheckBox;
    cb_reb: TCheckBox;
    cb_novo: TCheckBox;
    grp_demoSex: TGroupBox;
    cb_con2: TCheckBox;
    grp_ano2: TGroupBox;
    ed_ano2: TEdit;
    grp2: TGroupBox;
    btn1: TSpeedButton;
    grp3: TGroupBox;
    btn2: TSpeedButton;
    grp_codigo: TGroupBox;
    ed_codigo: TEdit;
    grp_email: TGroupBox;
    ed_email: TEdit;
    qryPlanoPrev: TwwQuery;
    qryAux: TwwQuery;
    qryEntidade: TwwQuery;
    qryIdadeSexo: TwwQuery;
    dsDemontrativoIdadeSexo: TwwDataSource;
    cdsDemostrativo: TwwClientDataSet;
    SDXML: TSaveDialog;
    pbdeDemostrativo: TppBDEPipeline;
    pDemonstrativoEstatistico: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    pedtDescricao: TppDBText;
    pedtAnterior: TppDBText;
    pedtEntrada: TppDBText;
    pedtSaida: TppDBText;
    pedtAtual: TppDBText;
    ppFooterBand2: TppFooterBand;
    pDemostrativoSexoIdade: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    pedtDescricaoIdadeSexo: TppDBText;
    pedtVlrFeminino: TppDBText;
    pedtVlrMasculino: TppDBText;
    ppFooterBand1: TppFooterBand;
    dtDemostrativo: TwwDataSource;
    qryAnterior: TwwQuery;
    qryEntrada: TwwQuery;
    BitBtn1: TBitBtn;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    cbDemoSexoIdade: TCheckBox;
    cbDemoEstatistico: TCheckBox;
    MontaSelectEstatistico: TMontaSelect;
    MontaSelectSexoIdade: TMontaSelect;
    qryVisualizarDemo: TwwQuery;
    cdsIdadeSexo: TCMClientDataSet;
    CMSqlParamsSexoIdade: TCMSqlParams;
    ppbdeDemoSexoIdade: TppBDEPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    pedtGrupoIdadeSexo: TppDBText;
    ppShape2: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    pplblFem: TppLabel;
    pplblMasc: TppLabel;
    ppLabel12: TppLabel;
    pedtEntidadeIdadeSexo: TppLabel;
    pedtCNPJIdadeSexo: TppLabel;
    pedtPeriodoIdadeSexc: TppLabel;
    pedtAnoReferenciaIdadeSexo: TppLabel;
    CMSqlParamsDemons: TCMSqlParams;
    pedtPeriodo: TppLabel;
    pedtCNPJ: TppLabel;
    pedtEntidade: TppLabel;
    ppShape4: TppShape;
    ppdbReferencia: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText1: TppDBText;
    cdsDemostrativoREFERENCIA: TStringField;
    cdsDemostrativoMES: TStringField;
    cdsDemostrativoTIPO: TStringField;
    cdsDemostrativoORDEM: TFloatField;
    cdsDemostrativoDESCRICAO: TStringField;
    cdsDemostrativoANTERIOR: TFloatField;
    cdsDemostrativoENTRADA: TFloatField;
    cdsDemostrativoSAIDA: TFloatField;
    cdsDemostrativoATUAL: TFloatField;
    GroupBox1: TGroupBox;
    ed_mes2: TEdit;
    qrySaida: TwwQuery;
    cdsDemostrativoCONTA: TStringField;
    cdsDemostrativoDAT: TStringField;
    qryAuxEntrada: TwwQuery;
    qryAuxSaida: TwwQuery;
    qryAuxAnterior: TwwQuery;
    qryAuxIdadeSexo: TwwQuery;
    ppLabel18: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryDelete: TwwQuery;
    qryDeleteSexo: TwwQuery;
    qryDeleteSexoAux: TwwQuery;
    qryDeleteAux: TwwQuery;
    procedure bbtnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure cb_semestreClick(Sender: TObject);
    procedure cbDemoSexoIdadeClick(Sender: TObject);
    procedure cbDemoEstatisticoClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_mes2Change(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ed_ano1KeyPress(Sender: TObject; var Key: Char);
    procedure ed_mes2KeyPress(Sender: TObject; var Key: Char);
    procedure ed_ano2KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    function iif(condicao:boolean;ivlrtrue,ivlrfalse:integer) : integer;
    function siif(condicao:boolean;svlrtrue,svlrfalse:String)  : String;
    function FormataCNPJ(CNPJ : string): string;
    function MensagemAtualiza():Boolean;

    procedure SelecionaPlanoPrev(flgPlano :Boolean);
    procedure SelecionaPlanoPrevMes(flgPlano :boolean);
    procedure SelecionaPlanoPrevMesXML(flgplano: boolean);//tirar
    procedure AbreConsulta(TipoDemostrativo :String; tipoacao :String);
    procedure AbreConsultaIdadeSexo();

    procedure DeletaDemoConsilado(Tipodemo : String;PlanoPrev :Integer);//tirar
    procedure DeletaDemoSexoIdade(PlanoPrev : integer);//tirar

    procedure GravaDemoConsolidado;
    procedure GravarDadosDemonstrativo(PlanoPrev : integer);
    procedure AtualizaDadosDemonstrativo(PlanoPrev: integer);
    procedure AtualizaDadosDemonstrativoConsolidado;
    procedure AtualizaSexoIdade(PlanoPrev :integer);
    procedure GravaSexoIdade(PlanoPrev :integer);


    procedure VisualizaDemoMesPlano2;
    procedure VisualizaDemoMesPlano66;
    procedure VisualizaDemoMesPlano74;
    procedure VisualizaDemoConsolidado;
    procedure VisualizaDemoSexoIdade(PlanoPrev :integer);

    procedure GeraXML;      // SEXO E IDADE
    procedure GeraXMLDemons;// Demonstrativos
    Procedure GeraXMLSexoIdadeCadastrado(PlanoPrev :integer);

    procedure GeraXMLDemoMesPlano2;
    procedure GeraXMLDemoMesPlano66;
    procedure GeraXMLDemoMesPlano74;
    procedure GeraXMLDemoConsolidado;

    procedure MonstraDemoMesPlano2;
    procedure MonstraDemoMesPlano66;
    procedure MonstraDemoMesPlano74;
    procedure MonstraDemoConsolidado;
    procedure MonstraDemoSexoIdade(PlanoPrev :integer);

    { Public declarations }
  end;

var
    frmMapaPrevic: TfrmMapaPrevic;
    PLANOCONTAB         : String;
    CONTA11100ENT       : String;
    CONTA11200ENT       : String;
    CONTA13000ENT       : String;
    CONTA14000ENT       : String;
    CONTA15000ENT       : String;
    DataReferenciaInicio: String;
    DataReferenciaFim   : String;
    sSemestre           : String;
    totalFem            : Integer;
    totalMasc           : Integer;
    execDemonstrativo   : Boolean;

implementation
uses DBaseDados,FPreview,UMensErro,UDataBase,USistema,FCadNumeroProtoco;

{$R *.DFM}
procedure TfrmMapaPrevic.AbreConsulta(TipoDemostrativo :String;tipoacao:String);
var
  nvcont,nvezes,anobusca,cont, mesinicio,mesfim,mesanterior,contString : integer;
  lstatual : tStringList;
  tipoDemo : String;
  semestreanterior :integer;
begin
  lstatual := tStringList.create;
  if (cb_semestre.Text = '1º Semestre')then begin
      mesinicio := 1;
      mesfim :=6;
      semestreanterior:=2;
      mesanterior:=12;
      anobusca :=   StrToInt(ed_ano1.text)-1;
  end
  else
  begin
      mesinicio := 7;
      mesfim :=12;
      semestreanterior:=1;
      mesanterior:=6;
      anobusca :=   StrToInt(ed_ano1.text);
  end;
  CMSqlParamsDemons.open;
  nvezes := 6;
  nvcont := 1;
//  nvezes := iif(TipoDemostrativo = 'N',1,6);
//  nvcont := iif(TipoDemostrativo = 'S',1,6);

  DataReferenciaInicio := trim(siif(mesinicio <10,'0','')+IntToStr(mesinicio)+'/'+ed_ano1.Text);

  if TipoDemostrativo = 'N' then begin
    tipoDemo := 'C';

    qryAuxAnterior.SQL.text :=('SELECT MAX(SEMESTREREFERENCIA) SEMESTRE ,MAX(ANOREFERENCIA) ANO           '+
    '  FROM MPREVICDEMONEST                                                                           '+
    '  WHERE  TIPODEMONSTRATIVO = ''C''                                                               '+
    ' AND ANOREFERENCIA = (SELECT MAX(MP.ANOREFERENCIA)                                                   '+
    '                           FROM MPREVICDEMONEST MP                                               '+
    '                                WHERE MP.TIPODEMONSTRATIVO = :TIPO AND MP.ANOREFERENCIA <= :ANO) ');


    qryAnterior.SQL.text :=('SELECT TIPODEMONSTRATIVO, '+
                       '      TIPOGRUPO,          '+
                       '      DESCRICAOCONTA,     '+
                       '      VALORANTERIORCONTA, '+
                       '      ATUAL,              '+
                       '      CPAG,               '+
                       '      CONTA               '+
                       ' FROM MPREVICDEMONEST     '+
                       ' WHERE TIPODEMONSTRATIVO = :TIPO  '+
                       ' AND ANOREFERENCIA = :ANO         '+
                       ' AND SEMESTREREFERENCIA = :SEMESTRE '+
                       ' AND MESREFERENCIA = '+intToStr(mesanterior) +
                       ' order by CPAG                    ');


  end
  else
  begin
    tipoDemo := 'A';

    qryAuxAnterior.SQL.text :=('SELECT MAX(SEMESTREREFERENCIA) SEMESTRE ,MAX(ANOREFERENCIA) ANO           '+
    '  FROM MPREVICDEMONEST                                                                           '+
    '  WHERE   TIPODEMONSTRATIVO = ''A''                                                              '+
    '  AND PLANOPREVIDENCIARIO IN (:PLANO)                                                            '+
    '  AND ANOREFERENCIA = (SELECT MAX(MP.ANOREFERENCIA)                                              '+
    '                           FROM MPREVICDEMONEST MP                                               '+
    '                                WHERE MP.TIPODEMONSTRATIVO = :TIPO '+
    '                                       AND PLANOPREVIDENCIARIO IN (:PLANO)'+
    '                                       AND MP.ANOREFERENCIA <= :ANO) ');

    qryAnterior.SQL.text :=('SELECT TIPODEMONSTRATIVO, '+
                       '      TIPOGRUPO,          '+
                       '      DESCRICAOCONTA,     '+
                       '      VALORANTERIORCONTA, '+
                       '      ATUAL,              '+
                       '      CPAG,               '+
                       '      CONTA               '+
                       ' FROM MPREVICDEMONEST     '+
                       ' WHERE TIPODEMONSTRATIVO = :TIPO     '+
                       ' AND PLANOPREVIDENCIARIO IN (:PLANO) '+
                       ' AND SEMESTREREFERENCIA = :SEMESTRE '+
                       ' AND MESREFERENCIA = '+intToStr(mesanterior)+
                       ' AND ANOREFERENCIA = :ANO            '+
                       ' order by CPAG                       ');

  end;
  if tipoacao = 'I' then begin
      qryAuxAnterior.SQL.Text := StringReplace(qryAuxAnterior.SQL.Text,':TIPO',QuotedStr(tipoDemo),[rfReplaceAll, rfIgnoreCase]);
      qryAuxAnterior.SQL.Text := StringReplace(qryAuxAnterior.SQL.Text,':ANO',ed_ano1.Text,[rfReplaceAll, rfIgnoreCase]);


      if tipoDemo = 'A' then
         qryAuxAnterior.SQL.Text := StringReplace(qryAuxAnterior.SQL.Text,':PLANO',PLANOCONTAB,[rfReplaceAll, rfIgnoreCase]);

      qryAuxAnterior.Close;
      qryAuxAnterior.open;
  end;

  if tipoacao = 'I' then begin
      qryAnterior.SQL.Text := StringReplace(qryAnterior.SQL.Text,':TIPO',QuotedStr(tipoDemo),[rfReplaceAll, rfIgnoreCase]);
      qryAnterior.SQL.Text := StringReplace(qryAnterior.SQL.Text,':SEMESTRE',qryAuxAnterior.FieldByName('SEMESTRE').AsString,[rfReplaceAll, rfIgnoreCase]);
      qryAnterior.SQL.Text := StringReplace(qryAnterior.SQL.Text,':ANO',qryAuxAnterior.FieldByName('ANO').AsString,[rfReplaceAll, rfIgnoreCase]);
  end
  else
  begin
      qryAnterior.SQL.Text := StringReplace(qryAnterior.SQL.Text,':TIPO',QuotedStr(tipoDemo),[rfReplaceAll, rfIgnoreCase]);
      qryAnterior.SQL.Text := StringReplace(qryAnterior.SQL.Text,':SEMESTRE',IntToStr(semestreanterior),[rfReplaceAll, rfIgnoreCase]);
      qryAnterior.SQL.Text := StringReplace(qryAnterior.SQL.Text,':ANO',IntToStr(anobusca),[rfReplaceAll, rfIgnoreCase]);
  end;

   if tipoDemo = 'A' then begin
     qryAnterior.SQL.Text := StringReplace(qryAnterior.SQL.Text,':PLANO',PLANOCONTAB,[rfReplaceAll, rfIgnoreCase]);
     qryAnterior.SQL.Text := StringReplace(qryAnterior.SQL.Text,'/*AND EV.IDEVENTOGERADOR NOT IN 338 APENAS PARA CONSOLIDADO*/',' AND EV.IDEVENTOGERADOR NOT IN 338 ',[rfReplaceAll, rfIgnoreCase]);
   end;

  //qryAnterior.sql.SaveToFile('C:\vaii.txt');
  qryAnterior.Close;
  qryAnterior.open;
   cont := 0;
  while not qryanterior.Eof do begin
      cdsDemostrativo.Append;
      cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+DataReferenciaInicio;
      cdsDemostrativo.FieldByName('Tipo').AsString :=  qryAnterior.fieldByName('TIPOGRUPO').AsString;
      cdsDemostrativo.FieldByName('Descricao').AsString :=  qryAnterior.fieldByName('DESCRICAOCONTA').AsString;

      if (mesinicio = 1) and ((qryAnterior.fieldByName('CONTA').AsInteger = 23000)
                            or(qryAnterior.fieldByName('CONTA').AsInteger = 21000)
                            or(qryAnterior.fieldByName('CONTA').AsInteger = 13000)
                            or(qryAnterior.fieldByName('CONTA').AsInteger = 15000)
                            or(qryAnterior.fieldByName('CONTA').AsInteger = 16000)) then // Conta que entraram em nova regra
         cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
      else
         cdsDemostrativo.FieldByName('Anterior').AsInteger :=  qryAnterior.fieldByName('ATUAL').AsInteger;

      cdsDemostrativo.FieldByName('ORDEM').AsInteger :=  cont;//qryAnterior.fieldByName('CPAG').AsInteger;
      cdsDemostrativo.FieldByName('CONTA').AsInteger :=  qryAnterior.fieldByName('CONTA').AsInteger;
      cdsDemostrativo.FieldByName('DAT').AsString :=  (formatfloat('00',mesinicio))+'/'+ed_ano1.Text;
      cdsDemostrativo.FieldByName('MES').AsString :=  formatfloat('00',mesinicio);
      cdsDemostrativo.post;
      qryAnterior.next;
      cont := cont+1;
  end;

  cont := 1;
  qryAnterior.First;
  while cont <= nvezes do
  begin
      DataReferenciaInicio := trim(siif(mesinicio <10,'0','')+IntToStr(mesinicio)+'/'+ed_ano1.Text);

      qryEntrada.SQL.Text := qryAuxEntrada.SQL.Text;
      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':CONTA11100ENT',CONTA11100ENT,[rfReplaceAll, rfIgnoreCase]);
      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':CONTA11200ENT',CONTA11200ENT,[rfReplaceAll, rfIgnoreCase]);
      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':CONTA13000ENT',CONTA13000ENT,[rfReplaceAll, rfIgnoreCase]);
      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':CONTA14000ENT',CONTA14000ENT,[rfReplaceAll, rfIgnoreCase]);
      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':CONTA1500ENT',CONTA15000ENT,[rfReplaceAll, rfIgnoreCase]);
      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':CONTRATO33000ENT',CONTA14000ENT,[rfReplaceAll, rfIgnoreCase]);

      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':PLANOCONTAB',PLANOCONTAB,[rfReplaceAll, rfIgnoreCase]);

      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':DATAINICIOPERIODO',QuotedStr('01/'+DataReferenciaInicio),[rfReplaceAll, rfIgnoreCase]);
      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,':NVEZES', IntToStr(1) ,[rfReplaceAll, rfIgnoreCase]);
      qryEntrada.SQL.Text := StringReplace(qryEntrada.SQL.Text,'DATAMES', IntToStr(1) ,[rfReplaceAll, rfIgnoreCase]);

      //qryEntrada.sql.SaveToFile('C:\vaii2.txt');
      qryEntrada.Close;
      qryEntrada.open;

      qrySaida.SQL.Text := qryAuxSaida.SQL.Text;
      qrySaida.SQL.Text := StringReplace(qrySaida.SQL.Text,':CONTA11100ENT',CONTA11100ENT,[rfReplaceAll, rfIgnoreCase]);
      qrySaida.SQL.Text := StringReplace(qrySaida.SQL.Text,':CONTA11200ENT',CONTA11200ENT,[rfReplaceAll, rfIgnoreCase]);
      qrySaida.SQL.Text := StringReplace(qrySaida.SQL.Text,':CONTA14000ENT',CONTA14000ENT,[rfReplaceAll, rfIgnoreCase]);
      qrySaida.SQL.Text := StringReplace(qrySaida.SQL.Text,':CONTRATO33000ENT',CONTA14000ENT,[rfReplaceAll, rfIgnoreCase]);

      qrySaida.SQL.Text := StringReplace(qrySaida.SQL.Text,':PLANOCONTAB',PLANOCONTAB,[rfReplaceAll, rfIgnoreCase]);

      qrySaida.SQL.Text := StringReplace(qrySaida.SQL.Text,':DATAINICIOPERIODO',QuotedStr('01/'+DataReferenciaInicio),[rfReplaceAll, rfIgnoreCase]);

      qrySaida.SQL.Text := StringReplace(qrySaida.SQL.Text,':NVEZES', IntToStr(1) ,[rfReplaceAll, rfIgnoreCase]);
      qrySaida.SQL.Text := StringReplace(qrySaida.SQL.Text,'DATAMES', IntToStr(1) ,[rfReplaceAll, rfIgnoreCase]);

      //qrySaida.sql.SaveToFile('C:\vaii3.txt');
      qrySaida.Close;
      qrySaida.open;

      while not qryEntrada.Eof do begin
          //if (mesinicio=1)then
          if (cdsDemostrativo.locate('ORDEM;Dat',vararrayof([qryEntrada.fieldByName('ORDEM').AsInteger,qryEntrada.fieldByName('Dat').AsString]),[]))then
              cdsDemostrativo.edit
          else  begin
            cdsDemostrativo.Append;

            cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+trim(siif(mesinicio <10,'0','')+IntToStr(mesinicio)+'/'+ed_ano1.Text);//DataReferenciaInicio;
            cdsDemostrativo.FieldByName('MES').AsString :=  formatfloat('00',mesinicio);
            cdsDemostrativo.FieldByName('Tipo').AsString :=  qryEntrada.fieldByName('Tipo').AsString;

            cdsDemostrativo.FieldByName('CONTA').AsInteger :=  qryEntrada.fieldByName('CONTA').AsInteger;
            cdsDemostrativo.FieldByName('DAT').AsString :=     qryEntrada.fieldByName('DAT').AsString;

            cdsDemostrativo.FieldByName('Descricao').AsString :=  qryEntrada.fieldByName('Descricao').AsString;

            //if (lstatual.count < 0) and (cont < 2)  then
            if (cont > 1)  then  begin
                cdsDemostrativo.FieldByName('Anterior').AsString :=  lstatual[qryEntrada.fieldByName('ORDEM').AsInteger];
                //MsgDlg(lstatual[qryEntrada.fieldByName('ORDEM').AsInteger], 'Informação', mtInformation, [mbOk], 0);
            end
            else begin
                cdsDemostrativo.FieldByName('Anterior').AsString :=  qryAnterior.fieldByName('VALORANTERIORCONTA').AsString;
                //MsgDlg( qryAnterior.fieldByName('VALORANTERIORCONTA').AsString, 'Informação', mtInformation, [mbOk], 0);
            end;

            cdsDemostrativo.FieldByName('ORDEM').AsInteger :=  qryEntrada.fieldByName('ORDEM').AsInteger;
            if not qryAnterior.Eof then
               qryAnterior.next;
          end;

         cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryEntrada.fieldByName('E').AsInteger;

         if (qrySaida.locate('ORDEM',qryEntrada.fieldByName('ORDEM').AsInteger,[]))then
            cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qrySaida.fieldByName('S').AsInteger
         else
            cdsDemostrativo.FieldByName('SAIDA').AsInteger := 0;

         cdsDemostrativo.FieldByName('ATUAL').AsInteger := (cdsDemostrativo.FieldByName('Anterior').AsInteger + cdsDemostrativo.FieldByName('Entrada').AsInteger)- cdsDemostrativo.FieldByName('Saida').AsInteger;
         if cdsDemostrativo.FieldByName('ATUAL').AsInteger < 0 then
            cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0;

         if ((lstatual.count-1) < qryEntrada.fieldByName('ORDEM').AsInteger) then
            lstatual.add(cdsDemostrativo.FieldByName('ATUAL').AsString)
         else
            lstatual[qryEntrada.fieldByName('ORDEM').AsInteger]:=(cdsDemostrativo.FieldByName('atual').AsString);
         //MsgDlg( cdsDemostrativo.FieldByName('atual').AsString, 'Informação', mtInformation, [mbOk], 0);
         //MsgDlg( lstatual[qryEntrada.fieldByName('ORDEM').AsInteger], 'Informação', mtInformation, [mbOk], 0);


         qryEntrada.next;
      end;
      cont     := cont+1;
      mesinicio:= mesinicio+1;
      nvcont   := nvcont+1;
  end;
  lstatual.Destroy;
end;

procedure TfrmMapaPrevic.bbtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMapaPrevic.BitBtn1Click(Sender: TObject);
// *****************************************************************************
// Autor(a)    : Higor Nayde Ferreira
// Data        : 02/04/2013
// Pendência   : SOL 84337 Kintana 525168
// Alteração   : SPC\Gerar Arquivo para SPC - MAPA PREVIC
// *****************************************************************************
var
  flgplano       : boolean;
  qryconsolidado : TwwQuery;
  sSql           :String;
  nvezes,cont, mesinicio,mesfim : integer;
  lstatual : tStringList;



begin
   if (ed_codigo.Text = '')then begin
      MsgDlg('É necessário preencher o campo com o Código da Entidade.', 'Informação', mtInformation, [mbOk], 0);
      exit;
   end;

   if (ed_email.Text = '')then begin
      MsgDlg('É necessário preencher o campo E-mail.', 'Informação', mtInformation, [mbOk], 0);
      exit;
   end;
   if ((cb_ana.Checked) or (cb_con1.Checked)) and (ed_ano1.Text = '')then begin
      MsgDlg('É necessário preencher o campo Ano de Referência.', 'Informação', mtInformation, [mbOk], 0);
      exit;
   end;

   if ((cb_ana.Checked) or (cb_con1.Checked)) and (cb_semestre.Text = '')then begin
      MsgDlg('É necessário preencher o campo Semestre de  Referência.', 'Informação', mtInformation, [mbOk], 0);
      exit;
   end;

   if (cb_con2.Checked) and (ed_mes2.Text = '')then begin
      MsgDlg('É necessário preencher o campo Mês de Referência.', 'Informação', mtInformation, [mbOk], 0);
      exit;
   end;
    if (cb_con2.Checked) and (ed_ano2.Text = '')then begin
      MsgDlg('É necessário preencher o campo Ano de Referência.', 'Informação', mtInformation, [mbOk], 0);
      exit;
   end;


  lstatual := tStringList.create;
  if (cb_semestre.Text = '1º Semestre')then begin
      mesinicio := 1;
      mesfim :=6;
      sSemestre := '01'
  end
  else
  begin
      mesinicio := 7;
      mesfim :=12;
      sSemestre := '02';
  end;
  try
     qryEntidade.Close;
     qryEntidade.ParamByName('ENTIDADE').AsInteger := StrToInt(ed_codigo.text);
     qryEntidade.Prepare;
     qryEntidade.Open;

      qryconsolidado := TwwQuery.Create(Application);
      qryconsolidado.DatabaseName:= 'BaseDados';

      execDemonstrativo := True;
      if MensagemAtualiza then begin
         if (MsgDlg('Já foram geradas informações para geração deste relatório, Deseja substituí-las?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
            execDemonstrativo := True
         else
            execDemonstrativo := False;
      end;



      if (cb_con1.Checked) then begin
        sSql := 'SELECT * FROM MPREVICDEMONEST '+
                ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND TIPODEMONSTRATIVO = ''C'''+
                '       AND SEMESTREREFERENCIA = '+sSemestre +
                '       AND ANOREFERENCIA = '+ ed_ano1.Text;
        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        if cb_con1.Checked then begin
             if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
                 MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
             end else
             begin
                 if (not cb_reg.Checked)and (not cb_reb.Checked) and (not cb_novo.Checked) then
                     SelecionaPlanoPrev(True)
                 else
                    SelecionaPlanoPrev(False);

                 if not qryconsolidado.IsEmpty then
                 begin
                       if execDemonstrativo then begin
                         AbreConsulta('N','A');
                         AtualizaDadosDemonstrativoConsolidado;
                       end
                 end else begin
                       AbreConsulta('N','I');
                       GravaDemoConsolidado;
                 end;
             end;
          end;
      end;

      if (not cb_reg.Checked) and (not cb_reb.Checked) and (not cb_novo.Checked) then
         flgplano := true
      else
         flgplano := false;

      if cb_ana.Checked then begin
         SelecionaPlanoPrevMes(flgplano);
      end;

      if (cb_con2.Checked) then begin

        sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
                '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO is null '+
                '       AND ANOREFERENCIA = '+ed_ano2.text +
                '       AND MESREFERENCIA = '+ed_mes2.text;

        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end
        else begin
           if (not cb_reg.Checked)and (not cb_reb.Checked) and (not cb_novo.Checked) then
              SelecionaPlanoPrev(True)
           else
              SelecionaPlanoPrev(False);

           if cb_con2.Checked then begin
               if (not qryconsolidado.IsEmpty) then begin
                   if execDemonstrativo then begin
                     AbreConsultaIdadeSexo;
                     AtualizaSexoIdade(0)
                   end;
                 end else begin
                     AbreConsultaIdadeSexo;
                     GravaSexoIdade(0);
               end;
           end;
        end;
      end;

      if (cb_con2.Checked and (flgplano or cb_reg.Checked)) then begin

        sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
                '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 2 '+
                '       AND ANOREFERENCIA = '+ed_ano2.text +
                '       AND MESREFERENCIA = '+ed_mes2.text;

        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        CONTA11100ENT :=  '149,154,156,492,495,503,505,513,514';
        CONTA11200ENT :=  '159,504,521';
        CONTA14000ENT :=  '164,338,496,197,522,497';
        PLANOCONTAB   :=  '2,28';

        if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin

           if cb_con2.Checked then begin
               if (not qryconsolidado.IsEmpty) then begin
                  if execDemonstrativo then begin
                     AbreConsultaIdadeSexo;
                     AtualizaSexoIdade(2);
                  end
               end else begin
                   AbreConsultaIdadeSexo;
                   GravaSexoIdade(2);
               end;
           end;
        end;
      end;

      if (cb_con2.Checked and (flgplano or cb_reb.Checked)) then begin

        sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
                '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 66 '+
                '       AND ANOREFERENCIA = '+ed_ano2.text +
                '       AND MESREFERENCIA = '+ed_mes2.text;

        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        CONTA11100ENT := '151,152,318,320,864,863,869,870';
        CONTA11200ENT := '160,161,328,329,867,868';
        CONTA14000ENT := '165,171,278,324,325,326,865,866,497';
        PLANOCONTAB   :=  '66';

        if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin

           if cb_con2.Checked then begin
               if (not qryconsolidado.IsEmpty) then begin
                  if execDemonstrativo then begin
                     AbreConsultaIdadeSexo;
                     AtualizaSexoIdade(66);
                  end;
                 end else begin
                     AbreConsultaIdadeSexo;
                     GravaSexoIdade(66);
               end;
           end;
        end;
      end;

      if (cb_con2.Checked and (flgplano or cb_novo.Checked)) then begin

        sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
                '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 74 '+
                '       AND ANOREFERENCIA = '+ed_ano2.text +
                '       AND MESREFERENCIA = '+ed_mes2.text;

        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        CONTA11100ENT := '479,480,487,864,863,869,870';
        CONTA11200ENT := '481,867,868';
        CONTA14000ENT := '482,488,865,866,497';
        PLANOCONTAB   :=  '74,75';


        if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin

           if cb_con2.Checked then begin
               if (not qryconsolidado.IsEmpty) then begin
                  if execDemonstrativo then begin
                     AbreConsultaIdadeSexo;
                     AtualizaSexoIdade(74);
                  end
                 end else begin
                     AbreConsultaIdadeSexo;
                     GravaSexoIdade(74);
               end;
           end;
        end;
      end;

    if cb_con1.Checked then
       MonstraDemoConsolidado;
    if cb_ana.Checked then
    begin
       if flgplano or cb_reg.Checked then
          MonstraDemoMesPlano2;
       if flgplano or cb_reb.Checked then
          MonstraDemoMesPlano66;
       if flgplano or cb_novo.Checked then
          MonstraDemoMesPlano74;
    end;


    if cb_con2.Checked then
          MonstraDemoSexoIdade(0);

    if cb_con2.Checked then
    begin
       if flgplano or cb_reg.Checked then
          MonstraDemoSexoIdade(2);
       if flgplano or cb_reb.Checked then
          MonstraDemoSexoIdade(66);
       if flgplano or cb_novo.Checked then
          MonstraDemoSexoIdade(74);
    end;
  Finally
     qryconsolidado.Destroy;
  end;
end;

function TfrmMapaPrevic.iif(condicao: boolean; ivlrtrue,
  ivlrfalse: integer): integer;
begin
  if(condicao)then
     result := ivlrtrue else result :=    ivlrfalse;
end;


function TfrmMapaPrevic.siif(condicao: boolean; svlrtrue,
  svlrfalse: String): String;
begin
  if(condicao)then
     result := svlrtrue else result :=    svlrfalse;
end;

procedure TfrmMapaPrevic.SelecionaPlanoPrev(flgPlano :Boolean);
begin
    PLANOCONTAB   := '';
    CONTA11100ENT := '';
    CONTA11200ENT := '';
    CONTA13000ENT := '';
    CONTA14000ENT := '';
    CONTA15000ENT := '';

   //Conta 11100
   if cb_reg.Checked or flgPlano  then begin
      CONTA11100ENT :=  '149,154,156,492,495,503,505,513,514';
      CONTA11200ENT :=  '159,504,521';
      CONTA13000ENT :=  '506,507,508,509,515';
      CONTA14000ENT :=  '164,338,496,197,522,497';
      CONTA15000ENT :=  '499,500';
      PLANOCONTAB   :=  '2,28';
   end;

   //REB11100 =
   if cb_reb.Checked or flgPlano then begin
      if CONTA11100ENT <> '' then
         CONTA11100ENT := CONTA11100ENT+',151,152,318,320,864,863,869,870'
      else
         CONTA11100ENT := CONTA11100ENT+'151,152,318,320,864,863,869,870';

      if CONTA11200ENT <> ''then
         CONTA11200ENT := CONTA11200ENT + ',160,161,328,329,867,868'
      else
         CONTA11200ENT := CONTA11200ENT +  '160,161,328,329,867,868';

      if CONTA13000ENT <> ''then
         CONTA13000ENT := CONTA13000ENT + ',251,252,277,319,323,327,517,526'
      else
         CONTA13000ENT := CONTA13000ENT + '251,252,277,319,323,327,517,526';

      if CONTA14000ENT <> ''then
         CONTA14000ENT := CONTA14000ENT + ',165,171,278,324,325,326,865,866,497'
      else
         CONTA14000ENT := CONTA14000ENT + '165,171,278,324,325,326,865,866,497';

      if CONTA15000ENT <> ''then
         CONTA15000ENT := CONTA15000ENT + ',279,322,253,321'
      else
         CONTA15000ENT := CONTA15000ENT + '279,322,253,321';

      if PLANOCONTAB <> ''then
         PLANOCONTAB := PLANOCONTAB + ',66'
      else
         PLANOCONTAB := PLANOCONTAB + '66';

   end;

   //NovoPlano11100
   if cb_novo.Checked or flgPlano then begin
      if CONTA11100ENT <> '' then
         CONTA11100ENT:= CONTA11100ENT +',479,480,487,864,863,869,870'
      else
         CONTA11100ENT:= CONTA11100ENT +'479,480,487,864,863,869,870';

      if CONTA11200ENT <> ''then
         CONTA11200ENT := CONTA11200ENT + ',481,867,868'
      else
         CONTA11200ENT := CONTA11200ENT + '481,867,868';

      if CONTA13000ENT <> ''then
         CONTA13000ENT := CONTA13000ENT + ',483,484,518,520,528'
      else
         CONTA13000ENT := CONTA13000ENT + '483,484,518,520,528';

      if CONTA14000ENT <> ''then
         CONTA14000ENT := CONTA14000ENT + ',482,488,865,866,497'
      else
         CONTA14000ENT := CONTA14000ENT + '482,488,865,866,497';

      if CONTA15000ENT <> ''then
         CONTA15000ENT := CONTA15000ENT + ',486,485'
      else
         CONTA15000ENT := CONTA15000ENT + '486,485';

      if PLANOCONTAB <> ''then
         PLANOCONTAB := PLANOCONTAB + ',74,75'
      else
         PLANOCONTAB := PLANOCONTAB + '74,75';
   end;
end;



procedure TfrmMapaPrevic.AbreConsultaIdadeSexo();
var
  nvezes,cont,mes : integer;
  lstatual : tStringList;
  vSql : String;
begin
  try
    lstatual := tStringList.create;
    mes := StrToInt(ed_mes2.Text);
    nvezes:=12;
    nvezes:=1;
    DataReferenciaInicio := '01/'+siif(mes <10,'0'+IntToStr(mes),IntToStr(mes))+'/' +ed_ano2.Text;
    //DataReferenciaInicio := '01/01/' +ed_ano2.Text;

    qryIdadeSexo.SQL.Text := qryAuxIdadeSexo.SQL.Text;
    vSql :=  qryIdadeSexo.SQL.Text;
    vSql := StringReplace(vSql,'DATAINICIOPERIODO',(''''+Trim(DataReferenciaInicio)+''''),[rfReplaceAll, rfIgnoreCase]);
    vSql := StringReplace(vSql,'CONTA11100ENT',CONTA11100ENT,[rfReplaceAll, rfIgnoreCase]);
    vSql := StringReplace(vSql,'CONTA11200ENT',CONTA11200ENT,[rfReplaceAll, rfIgnoreCase]);
    vSql := StringReplace(vSql,'CONTA14000ENT',CONTA14000ENT,[rfReplaceAll, rfIgnoreCase]);
    vSql := StringReplace(vSql,'PLANOCONTAB',PLANOCONTAB,[rfReplaceAll, rfIgnoreCase]);

    vSql := StringReplace(vSql,'NVEZES',IntToStr(nvezes),[rfReplaceAll, rfIgnoreCase]);
    CMSqlParamsSexoIdade.open;
    cont := 1;
    qryIdadeSexo.Close;
    qryIdadeSexo.SQL.Clear;
    qryIdadeSexo.SQL.Add(vSql);
    //qryIdadeSexo.sql.SaveToFile('C:\SexoIdade.txt');
    qryIdadeSexo.Prepare;
    qryIdadeSexo.open;

    while not qryIdadeSexo.Eof do begin
      cdsIdadeSexo.Append;
      cdsIdadeSexo.FieldByName('TIPO').AsString      :=  qryIdadeSexo.FieldByName('TIPO').AsString;
      cdsIdadeSexo.FieldByName('DESCRICAO').AsString :=  qryIdadeSexo.FieldByName('DESCRICAO').AsString;
      cdsIdadeSexo.FieldByName('FEM').AsInteger      :=  qryIdadeSexo.FieldByName('FEM').AsInteger;
      cdsIdadeSexo.FieldByName('MASC').AsInteger     :=  qryIdadeSexo.FieldByName('MASC').AsInteger;
      cdsIdadeSexo.FieldByName('CODIGO').AsInteger    :=  qryIdadeSexo.FieldByName('CODIGO').AsInteger;
      cdsIdadeSexo.FieldByName('MES').AsString    :=  ed_mes2.Text;
      cdsIdadeSexo.post;
      qryIdadeSexo.next;
    end;
  Finally
    lstatual.Destroy;
  end;
end;


procedure TfrmMapaPrevic.GravarDadosDemonstrativo(PlanoPrev : integer);
var
  cont :integer;
begin
    cont:=0;
    cdsDemostrativo.First;
    while not cdsDemostrativo.eof do begin
      try
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' INSERT INTO MPREVICDEMONEST(    '+
                        '    ENTIDADE,                  '+
                        '    CNPJ,                      '+
                        '    PLANOPREVIDENCIARIO,       '+
                        '    CODIGOENTIDADE,            '+
                        '    TIPODEMONSTRATIVO,         '+
                        '    TIPOGRUPO,                 '+
                        '    ANOREFERENCIA,             '+
                        '    MESREFERENCIA,             '+
                        '    SEMESTREREFERENCIA,        '+
                        '    CONTA,                     '+
                        '    DESCRICAOCONTA,            '+
                        '    VALORANTERIORCONTA,        '+
                        '    ENTRADA,                   '+
                        '    SAIDA,                     '+
                        '    ATUAL,                     '+
                        '    FLGARQUIVOGERADO,          '+
                        '    FLGARQUIVOENVIADO,         '+
                        '    CPAG,                      '+
                        '    TRGUSERINCLUSAO,           '+
                        '    TRGDTINCLUSAO              '+
                        '  ) VALUES(                    '+
                        ' '''+qryEntidade.FieldByName('NOME').AsString +''','+
                        qryEntidade.FieldByName('CNPJ').AsString+','+
                        IntToStr(PlanoPrev)  +','+
                        qryEntidade.FieldByName('CODFUNDSPC').AsString+','+
                        ' ''A'','+
                        ' '''+cdsDemostrativo.FieldByName('TIPO').AsString +''','+
                        //' '''+qryEntidade.FieldByName('CODFUNDSPC').AsString+''','+
                        ' '''+ed_ano1.Text +''','+
                        ' '''+cdsDemostrativo.FieldByName('MES').AsString+''','+
                        sSemestre+','+
                        cdsDemostrativo.FieldByName('CONTA').AsString+','+
                        ' '''+cdsDemostrativo.FieldByName('Descricao').AsString+''','+
                        cdsDemostrativo.FieldByName('ANTERIOR').AsString+','+
                        cdsDemostrativo.FieldByName('ENTRADA').AsString+','+
                        cdsDemostrativo.FieldByName('SAIDA').AsString+','+
                        cdsDemostrativo.FieldByName('ATUAL').AsString+','+
                        '1 ,'+
                        '0 ,'+
                        IntToStr(cont)+','+
                        ' ''CM'+IntToStr(Sistema.IdUsuario)+''','+
                        ' SYSDATE)');
          //qryAux.sql.SaveToFile('C:\insetMPREVICDEMONEST.txt');

          qryAux.ExecSQL;
          cont:=cont+1;
          cdsDemostrativo.next;
          CommitTransacao;
      except
             RollBackTransacao;
             MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
             Exit;
      end;
    end;
end;


procedure TfrmMapaPrevic.SelecionaPlanoPrevMes(flgPlano :boolean);
var
  mesinicio,mesfim :integer;
  qryValida : TwwQuery;
  sSql      : String;
begin
  try
      qryValida   := TwwQuery.Create(Application);
      qryValida.DatabaseName := 'BaseDados';

      if (cb_semestre.Text = '1º Semestre')then begin
          mesinicio := 1;
          mesfim :=6;
      end else begin
          mesinicio := 7;
          mesfim :=12;
      end;
      PLANOCONTAB   := '';
      CONTA11100ENT := '';
      CONTA11200ENT := '';
      CONTA13000ENT := '';
      CONTA14000ENT := '';
      CONTA15000ENT := '';

      if (cb_ana.Checked and (flgplano or cb_reg.Checked)) then begin
          sSql := 'SELECT * FROM MPREVICDEMONEST '+
                  ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                  '       AND PLANOPREVIDENCIARIO = 2'+
                  '       AND TIPODEMONSTRATIVO = ''A'''+
                  '       AND ANOREFERENCIA = '+ ed_ano1.Text+
                  '       AND SEMESTREREFERENCIA = '+ sSemestre;
          qryValida.close;
          qryValida.SQL.Clear;
          qryValida.SQL.Add(sSql);
          qryValida.Prepare;
          qryValida.open;

        if not qryValida.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin
            //Conta 11100
          if (cb_reg.Checked or flgPlano) then
          begin
              CONTA11100ENT :=  '149,154,156,492,495,503,505,513,514';
              CONTA11200ENT :=  '159,504,521';
              CONTA13000ENT :=  '506,507,508,509,515';
              CONTA14000ENT :=  '164,338,496,197,522,497';
              CONTA15000ENT :=  '499,500';
              PLANOCONTAB   :=  '2,28';

            if not qryValida.IsEmpty then
            begin
               if execDemonstrativo then begin
                qryPlanoPrev.close;
                qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '2';
                qryPlanoPrev.prepare;
                qryPlanoPrev.open;
                AbreConsulta('S','A');
                AtualizaDadosDemonstrativo(2);
              end
            end else begin
              qryPlanoPrev.close;
              qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '2';
              qryPlanoPrev.prepare;
              qryPlanoPrev.open;
              AbreConsulta('S','I');
              GravarDadosDemonstrativo(2);
            end;
          end;
        end;
      end;
      
      if (cb_ana.Checked) then begin
          sSql := 'SELECT * FROM MPREVICDEMONEST '+
                  ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                  '       AND PLANOPREVIDENCIARIO = 66'+
                  '       AND TIPODEMONSTRATIVO = ''A'''+
                  '       AND ANOREFERENCIA = '+ ed_ano1.Text+
                  '       AND SEMESTREREFERENCIA = '+ sSemestre;
          qryValida.close;
          qryValida.SQL.Clear;
          qryValida.SQL.Add(sSql);
          qryValida.Prepare;
          qryValida.open;

          if not qryValida.FieldByName('NUMPROTOCOLO').IsNull then begin
             MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
          end else
          begin
              //REB11100 =    66
              if (cb_reb.Checked or flgPlano) then begin

                CONTA11100ENT := '151,152,318,320,864,863,869,870';
                CONTA11200ENT := '160,161,328,329,867,868';
                CONTA13000ENT := '251,252,277,319,323,327,517,526';
                CONTA14000ENT := '165,171,278,324,325,326,865,866,497';
                CONTA15000ENT := '279,322,253,321';
                PLANOCONTAB   :=  '66';

                if not qryValida.IsEmpty then begin
                   if execDemonstrativo then begin
                      qryPlanoPrev.close;
                      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString := '66';
                      qryPlanoPrev.prepare;
                      qryPlanoPrev.open;
                      AbreConsulta('S','A');
                      AtualizaDadosDemonstrativo(66);
                   end
                end else begin
                    qryPlanoPrev.close;
                      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString := '66';
                      qryPlanoPrev.prepare;
                      qryPlanoPrev.open;
                      AbreConsulta('S','I');
                      GravarDadosDemonstrativo(66);
                end;
              end;
          end;
      end;
      if (cb_ana.Checked) then
      begin
          sSql := 'SELECT * FROM MPREVICDEMONEST '+
                  ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                  '       AND PLANOPREVIDENCIARIO = 74'+
                  '       AND TIPODEMONSTRATIVO = ''A'''+
                  '       AND ANOREFERENCIA = '+ ed_ano1.Text+
                  '       AND SEMESTREREFERENCIA = '+ sSemestre;

          qryValida.close;
          qryValida.SQL.Clear;
          qryValida.SQL.Add(sSql);
          qryValida.Prepare;
          qryValida.open;

         if not qryValida.FieldByName('NUMPROTOCOLO').IsNull then begin
               MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
         end else
         begin
            //NovoPlano11100  74
            if (cb_novo.Checked or flgPlano) then
            begin
                  CONTA11100ENT := '479,480,487,864,863,869,870';
                  CONTA11200ENT := '481,867,868';
                  CONTA13000ENT := '483,484,518,520,528';
                  CONTA14000ENT := '482,488,865,866,497';
                  CONTA15000ENT := '485,486';
                  PLANOCONTAB   :=  '74,75';
              if not qryValida.IsEmpty then
                begin
                     if execDemonstrativo then begin
                      qryPlanoPrev.close;
                      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
                      qryPlanoPrev.prepare;
                      qryPlanoPrev.open;
                      AbreConsulta('S','A');
                      AtualizaDadosDemonstrativo(74);
                    end
                 end else begin
                    qryPlanoPrev.close;
                    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
                    qryPlanoPrev.prepare;
                    qryPlanoPrev.open;
                    AbreConsulta('S','I');
                    GravarDadosDemonstrativo(74);
                  end
              end;
         end;
      end;
  Finally
    qryValida.Destroy;
  end;
end;


procedure TfrmMapaPrevic.btn2Click(Sender: TObject);
var
   flgSexoIdade, flgEstatistico :boolean;
begin
  if (not cbDemoSexoIdade.Checked)and(not cbDemoEstatistico.Checked) then begin
    MsgDlg('É necessário selecionar o Tipo do demonstrativo', 'Informação', mtInformation, [mbOk], 0);
      cbDemoEstatistico.SetFocus;
      exit;
  end;
  if (cbDemoEstatistico.Checked) then begin
     MontaSelectEstatistico.Executar;
     if (not MontaSelectEstatistico.RetornouValor) then
        exit;
     flgSexoIdade     := False;
     flgEstatistico   := True;
     end;
  if (cbDemoSexoIdade.Checked)then begin
     MontaSelectSexoIdade.Executar;
     if (not MontaSelectSexoIdade.RetornouValor) then
        exit;
     flgSexoIdade     := True;
     flgEstatistico   := False;
  end;




  if (cbDemoSexoIdade.Checked)then begin
       FrmCadNumeroProtoco := TFrmCadNumeroProtoco.Create(Application);
       FrmCadNumeroProtoco.SetCampos(flgEstatistico,flgSexoIdade,
                                     MontaSelectSexoIdade.ValoresChave[2],
                                     '',
                                     MontaSelectSexoIdade.ValoresChave[0],
                                     MontaSelectSexoIdade.ValoresChave[5],
                                     MontaSelectSexoIdade.ValoresChave[4]);

       AbrirForm(FrmCadNumeroProtoco,TFrmCadNumeroProtoco, False);
  end;
  if (cbDemoEstatistico.Checked)then begin
       FrmCadNumeroProtoco := TFrmCadNumeroProtoco.Create(Application);
       FrmCadNumeroProtoco.SetCampos(flgEstatistico,flgSexoIdade,
                                     MontaSelectEstatistico.ValoresChave[2],
                                     MontaSelectEstatistico.ValoresChave[3],
                                     MontaSelectEstatistico.ValoresChave[0],
                                     MontaSelectEstatistico.ValoresChave[1],
                                     MontaSelectEstatistico.ValoresChave[4]);

       AbrirForm(FrmCadNumeroProtoco,TFrmCadNumeroProtoco, False);
  end;


end;

procedure TfrmMapaPrevic.cb_semestreClick(Sender: TObject);
begin
  if (cb_semestre.Text = '1º Semestre')then
      sSemestre := '01'
  else
      sSemestre := '02';
end;
procedure TfrmMapaPrevic.cbDemoSexoIdadeClick(Sender: TObject);
begin
  inherited;
  if cbDemoSexoIdade.Checked then
     cbDemoEstatistico.Checked := false
//  else
  //   cbDemoEstatistico.Checked := true;
end;

procedure TfrmMapaPrevic.cbDemoEstatisticoClick(Sender: TObject);
begin
  inherited;
  if cbDemoEstatistico.Checked then
     cbDemoSexoIdade.Checked := false
//  else
  //  cbDemoSexoIdade.Checked := true;
end;

procedure TfrmMapaPrevic.btn1Click(Sender: TObject);

begin
  inherited;
  if (not cbDemoSexoIdade.Checked)and(not cbDemoEstatistico.Checked) then begin
      MsgDlg('É necessário selecionar o Tipo do demonstrativo', 'Informação', mtInformation, [mbOk], 0);
        cbDemoEstatistico.SetFocus;
        exit;
  end;

  if (cbDemoEstatistico.Checked) then begin
     MontaSelectEstatistico.Executar;
     if (not MontaSelectEstatistico.RetornouValor) then
        exit;
     flgSexoIdade     := False;
     flgEstatistico   := True;
  end;
  if (cbDemoSexoIdade.Checked)then begin
     MontaSelectSexoIdade.Executar;
     if (not MontaSelectSexoIdade.RetornouValor) then
        exit;
     flgSexoIdade     := True;
     flgEstatistico   := False;
  end;

  if (cbDemoEstatistico.Checked) then begin
    VisualizaDemoConsolidado;
    VisualizaDemoMesPlano2;
    VisualizaDemoMesPlano66;
    VisualizaDemoMesPlano74;
  end;
  {if (cbDemoSexoIdade.Checked) then
       VisualizaDemoSexoIdade;}
   if cbDemoSexoIdade.Checked then
    begin
       VisualizaDemoSexoIdade(0);
       VisualizaDemoSexoIdade(2);
       VisualizaDemoSexoIdade(66);
       VisualizaDemoSexoIdade(74);
    end;

end;

procedure TfrmMapaPrevic.GravaDemoConsolidado;
var
  cont :integer;
begin
    cont:=0;
    {qryEntidade.Close;
    qryEntidade.ParamByName('ENTIDADE').AsInteger := StrToInt(ed_codigo.Text);
    qryEntidade.Prepare;
    qryEntidade.open;}
    cdsDemostrativo.First;
    StartTransacao;
    while not cdsDemostrativo.eof do
    begin
      try
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' INSERT INTO MPREVICDEMONEST(  '+
                        '    ENTIDADE,                  '+
                        '    CNPJ,                      '+
                        '    CODIGOENTIDADE,       '+
                        '    TIPODEMONSTRATIVO,         '+
                        '    TIPOGRUPO,                 '+
                        '    ANOREFERENCIA,             '+
                        '    MESREFERENCIA,             '+
                        '    SEMESTREREFERENCIA,        '+
                        '    CONTA,                     '+
                        '    DESCRICAOCONTA,            '+
                        '    VALORANTERIORCONTA,        '+
                        '    ENTRADA,                   '+
                        '    SAIDA,                     '+
                        '    ATUAL,                     '+
                        '    FLGARQUIVOGERADO,          '+
                        '    FLGARQUIVOENVIADO,         '+
                        '    CPAG,                      '+
                        '    TRGUSERINCLUSAO,           '+
                        '    TRGDTINCLUSAO              '+
                        '  ) VALUES(                    '+
                        ' '''+qryEntidade.FieldByName('NOME').AsString +''','+
                        qryEntidade.FieldByName('CNPJ').AsString+','+
                        qryEntidade.FieldByName('CODFUNDSPC').AsString+','+
                        ' ''C'','+
                        ' '''+cdsDemostrativo.FieldByName('TIPO').AsString +''','+
                        //' '''+qryEntidade.FieldByName('CODFUNDSPC').AsString+''','+
                        ' '''+ed_ano1.Text +''','+
                        ' '''+cdsDemostrativo.FieldByName('MES').AsString +''','+
                        sSemestre+','+
                        cdsDemostrativo.FieldByName('CONTA').AsString+','+
                        ' '''+cdsDemostrativo.FieldByName('Descricao').AsString+''','+
                        cdsDemostrativo.FieldByName('ANTERIOR').AsString+','+
                        cdsDemostrativo.FieldByName('ENTRADA').AsString+','+
                        cdsDemostrativo.FieldByName('SAIDA').AsString+','+
                        cdsDemostrativo.FieldByName('ATUAL').AsString+','+
                        '1 ,'+
                        '0 ,'+
                        IntToStr(cont)+','+
                        ' ''CM'+IntToStr(Sistema.IdUsuario)+''','+
                        ' SYSDATE )');

          //qryAux.sql.SaveToFile('C:\insetMPREVICDEMONEST.txt');
          qryAux.ExecSQL;
          cont:=cont+1;
          cdsDemostrativo.next;
          CommitTransacao;
      except
             RollBackTransacao;
             MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
             Exit;
      end;
    end;
end;

procedure TfrmMapaPrevic.VisualizaDemoMesPlano2;
var sSQL:String;
begin
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ MontaSelectEstatistico.ValoresChave[1]+
          ' AND PLANOPREVIDENCIARIO     = 2 '+
          ' AND	ANOREFERENCIA           = '+ MontaSelectEstatistico.ValoresChave[2]+
          ' AND SEMESTREREFERENCIA      = '+ MontaSelectEstatistico.ValoresChave[3]+
          ' ORDER BY CPAG ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsDemons.Open;

    while not qryVisualizarDemo.Eof do begin
        cdsDemostrativo.Append;
        cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
        qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Tipo').AsString            :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
        cdsDemostrativo.FieldByName('Descricao').AsString       :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
        cdsDemostrativo.FieldByName('MES').AsString             :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Entrada').AsInteger        :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
        cdsDemostrativo.FieldByName('SAIDA').AsInteger          :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
         if qryVisualizarDemo.fieldByName('ATUAL').AsInteger <0 then
                cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('ATUAL').AsInteger := qryVisualizarDemo.fieldByName('ATUAL').AsInteger;


        if qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger <0 then
                cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
        //cdsDemostrativo.FieldByName('ATUAL').AsInteger          :=  qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
        //cdsDemostrativo.FieldByName('Anterior').AsInteger       :=  qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
        cdsDemostrativo.post;
        qryVisualizarDemo.next;

    end;
    qryVisualizarDemo.First;
    cdsDemostrativo.First;
    qryPlanoPrev.close;
    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '2';
    qryPlanoPrev.prepare;
    qryPlanoPrev.open;

    pedtEntidade.Text := qryVisualizarDemo.fieldByName('CODIGOENTIDADE').AsString + ' - '+qryVisualizarDemo.FieldByName('ENTIDADE').AsString;
    pedtCNPJ.Text := qryPlanoPrev.FieldByName('CNPB').AsString + ' - ' + qryPlanoPrev.FieldByName('NOME').AsString;
    ppLabel10.Text := 'Plano: ';
    pedtPeriodo.Text := qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
    if (qryVisualizarDemo.fieldByName('MESREFERENCIA').AsInteger < 7)then
      pedtPeriodo.Text := pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
    else
      pedtPeriodo.Text := pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

    TFrmPreview.CreateModalPreview(Application, pDemonstrativoEstatistico,qryPlanoPrev.FieldByName('NOME').AsString);
  end;
end;

procedure TfrmMapaPrevic.VisualizaDemoMesPlano66;
var sSQL:String;
begin
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ MontaSelectEstatistico.ValoresChave[1]+
          ' AND PLANOPREVIDENCIARIO     = 66'+
          ' AND	ANOREFERENCIA           = '+ MontaSelectEstatistico.ValoresChave[2]+
          ' AND SEMESTREREFERENCIA      = '+ MontaSelectEstatistico.ValoresChave[3]+
          ' ORDER BY CPAG ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;

  if (not qryVisualizarDemo.IsEmpty) then
  begin
     CMSqlParamsDemons.Open;

      while not qryVisualizarDemo.Eof do begin
          cdsDemostrativo.Append;
          cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
          qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

          cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
          cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
          cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
          cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
          cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
           if qryVisualizarDemo.fieldByName('ATUAL').AsInteger <0 then
                cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('ATUAL').AsInteger := qryVisualizarDemo.fieldByName('ATUAL').AsInteger;


        if qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger <0 then
                cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          //cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
          //cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          cdsDemostrativo.post;
          qryVisualizarDemo.next;
      end;
      qryVisualizarDemo.First;
      qryPlanoPrev.close;
      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '66';
      qryPlanoPrev.prepare;
      qryPlanoPrev.open;

      pedtEntidade.Text := qryVisualizarDemo.fieldByName('CODIGOENTIDADE').AsString + ' - '+qryVisualizarDemo.FieldByName('ENTIDADE').AsString;
      pedtCNPJ.Text := qryPlanoPrev.FieldByName('CNPB').AsString + ' - ' + qryPlanoPrev.FieldByName('NOME').AsString;
      ppLabel10.Text := 'Plano: ';
      pedtPeriodo.Text := qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
      if (qryVisualizarDemo.fieldByName('MESREFERENCIA').AsInteger < 7)then
        pedtPeriodo.Text := pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
      else
        pedtPeriodo.Text := pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

      TFrmPreview.CreateModalPreview(Application, pDemonstrativoEstatistico,qryPlanoPrev.FieldByName('NOME').AsString);
  end;
end;

procedure TfrmMapaPrevic.VisualizaDemoMesPlano74;
var sSQL:String;
begin
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ MontaSelectEstatistico.ValoresChave[1]+
          ' AND PLANOPREVIDENCIARIO     = 74'+
          ' AND	ANOREFERENCIA           = '+ MontaSelectEstatistico.ValoresChave[2]+
          ' AND SEMESTREREFERENCIA      = '+ MontaSelectEstatistico.ValoresChave[3]+
          ' ORDER BY CPAG ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
      CMSqlParamsDemons.Open;
      while not qryVisualizarDemo.Eof do begin
          cdsDemostrativo.Append;
          cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
          qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

          cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
          cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
          cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
          cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
          cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
           if qryVisualizarDemo.fieldByName('ATUAL').AsInteger <0 then
                cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('ATUAL').AsInteger := qryVisualizarDemo.fieldByName('ATUAL').AsInteger;


        if qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger <0 then
                cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          //cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
          //cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          cdsDemostrativo.post;
          qryVisualizarDemo.next;
      end;
      qryVisualizarDemo.First;
      qryPlanoPrev.close;
      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
      qryPlanoPrev.prepare;
      qryPlanoPrev.open;

      pedtEntidade.Text := qryVisualizarDemo.fieldByName('CODIGOENTIDADE').AsString + ' - '+qryVisualizarDemo.FieldByName('ENTIDADE').AsString;
      pedtCNPJ.Text := qryPlanoPrev.FieldByName('CNPB').AsString + ' - ' + qryPlanoPrev.FieldByName('NOME').AsString;
      ppLabel10.Text := 'Plano: ';
      pedtPeriodo.Text := qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
      if (qryVisualizarDemo.fieldByName('MESREFERENCIA').AsInteger < 7)then
        pedtPeriodo.Text := pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
      else
        pedtPeriodo.Text := pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

      TFrmPreview.CreateModalPreview(Application, pDemonstrativoEstatistico,qryPlanoPrev.FieldByName('NOME').AsString);
  end;
end;

procedure TfrmMapaPrevic.VisualizaDemoConsolidado;
  var sSQL:String;
begin
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ MontaSelectEstatistico.ValoresChave[1]+
          ' AND TIPODEMONSTRATIVO     = ''C'''+
          ' AND	ANOREFERENCIA           = '+ MontaSelectEstatistico.ValoresChave[2]+
          ' AND SEMESTREREFERENCIA      = '+ MontaSelectEstatistico.ValoresChave[3]+
          ' ORDER BY CPAG ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsDemons.Open;
    while not qryVisualizarDemo.Eof do begin
        cdsDemostrativo.Append;
        cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
        qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

        cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
        cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
        cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
        cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
        //cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;

        if qryVisualizarDemo.fieldByName('ATUAL').AsInteger <0 then
                cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('ATUAL').AsInteger := qryVisualizarDemo.fieldByName('ATUAL').AsInteger;


        if qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger <0 then
                cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
        cdsDemostrativo.post;
        qryVisualizarDemo.next;
    end;
    qryVisualizarDemo.First;
    qryPlanoPrev.close;
    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
    qryPlanoPrev.prepare;
    qryPlanoPrev.open;

    pedtEntidade.Text := qryVisualizarDemo.fieldByName('CODIGOENTIDADE').AsString + ' - '+qryVisualizarDemo.FieldByName('ENTIDADE').AsString;
    pedtCNPJ.Text := '00.436.923/0001-90'; //FormataCNPJ(qryVisualizarDemo.FieldByName('CNPJ').AsString);
    ppLabel10.Text := 'CNPJ: ';   // Alterado pela Monica -  SOL 231507 - Para mudar a Flag para CNPJ quando o demostrativo for consolidade.
    pedtPeriodo.Text := qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
    if (qryVisualizarDemo.fieldByName('MESREFERENCIA').AsInteger < 7)then
      pedtPeriodo.Text := pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
    else
      pedtPeriodo.Text := pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

    TFrmPreview.CreateModalPreview(Application, pDemonstrativoEstatistico,'Consolidado');
  end;
end;

procedure TfrmMapaPrevic.VisualizaDemoSexoIdade(PlanoPrev :integer);
var sSQL,plano:String;
begin
  if PlanoPrev = 0 then
       plano:=' IS NULL '
  else
       plano:='  = ' + IntToStr(PlanoPrev);

  sSQL := ' SELECT * FROM  MPREVICDEMONESTIDSEX '+
          ' WHERE ANOREFERENCIA =   '+MontaSelectSexoIdade.ValoresChave[2]+
          ' AND MESREFERENCIA = '+MontaSelectSexoIdade.ValoresChave[3]+
          ' AND CODIGOENTIDADE =    '+MontaSelectSexoIdade.ValoresChave[1]+
          ' AND PLANOPREVIDENCIARIO' +plano+
          ' ORDER BY CPAG   ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;

  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsSexoIdade.Open;

    while not qryVisualizarDemo.Eof do begin

        cdsIdadeSexo.Append;
        cdsIdadeSexo.FieldByName('TIPO').AsString      :=  qryVisualizarDemo.FieldByName('CATEGORIA').AsString;
        cdsIdadeSexo.FieldByName('DESCRICAO').AsString :=  qryVisualizarDemo.FieldByName('FAIXAIDADE').AsString;
        cdsIdadeSexo.FieldByName('FEM').AsInteger      :=  qryVisualizarDemo.FieldByName('FEMININO').AsInteger;
        cdsIdadeSexo.FieldByName('MASC').AsInteger     :=  qryVisualizarDemo.FieldByName('MASCULINO').AsInteger;
        cdsIdadeSexo.post;
        qryVisualizarDemo.next;
    end;
    cdsIdadeSexo.First;
    qryVisualizarDemo.First;
    qryPlanoPrev.close;
    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  IntToStr(PlanoPrev);
    qryPlanoPrev.prepare;
    qryPlanoPrev.open;


    pedtAnoReferenciaIdadeSexo.Text :=qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString;
    pedtEntidadeIdadeSexo.Text := qryEntidade.FieldByName('CODFUNDSPC').AsString + ' - '+qryEntidade.FieldByName('NOME').AsString;
    if PlanoPrev = 0 then
       begin
        pedtCNPJIdadeSexo.Text := '00.436.923/0001-90' ;//FormataCNPJ(qryVisualizarDemo.FieldByName('CNPJ').AsString) //qryVisualizarDemo.FieldByName('CNPJ').AsString
        ppLabel3.Caption := 'CNPJ: ';  // Alterado pela Monica -  SOL 231507 - Para mudar a Flag para CNPJ quando o demostrativo for consolidade.
       end
    else begin
        ppLabel3.Caption := 'Plano: ';
        pedtCNPJIdadeSexo.Text := (qryPlanoPrev.FieldByName('CNPB').AsString + ' - ' + qryPlanoPrev.FieldByName('NOME').AsString);
     end;
    pedtPeriodoIdadeSexc.Text := qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString+' a '+qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString;

    if PlanoPrev = 0 then
        TFrmPreview.CreateModalPreview(Application, pDemostrativoSexoIdade,'Demonstrativo DSI')
    else
        TFrmPreview.CreateModalPreview(Application, pDemostrativoSexoIdade,'Demonstrativo DSI - '+qryPlanoPrev.FieldByName('NOME').AsString);
  end;
end;

procedure TfrmMapaPrevic.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  if not qryVisualizarDemo.IsEmpty then begin
    pedtAnoReferenciaIdadeSexo.Text :=qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString;
    pedtEntidadeIdadeSexo.Text := qryEntidade.FieldByName('CODFUNDSPC').AsString + ' - '+qryEntidade.FieldByName('NOME').AsString;
    //pedtCNPJIdadeSexo.Text := qryVisualizarDemo.FieldByName('CNPJ').AsString;
    pedtPeriodoIdadeSexc.Text := qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString+' a '+qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString;
  end;
end;

procedure TfrmMapaPrevic.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  totalFem:=totalFem+cdsIdadeSexo.fieldbyname('FEM').asinteger;
  totalMasc:=totalMasc+cdsIdadeSexo.fieldbyname('MASC').asinteger;
end;

procedure TfrmMapaPrevic.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  totalFem:=0;
  totalMasc:=0;
end;

procedure TfrmMapaPrevic.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  pplblFem.caption:=inttostr(totalFem);
  pplblMasc.caption:=inttostr(totalMasc);
end;

procedure TfrmMapaPrevic.GravaSexoIdade(PlanoPrev :integer);
var
  cont :integer;
  plano :string;
begin
    //Grava na estrutura MPREVICDEMONESTIDSEX os dados gerados pelo demonstrativo SEXO IDADE
    cont:=0;
    cdsIdadeSexo.First;
    StartTransacao;
    if PlanoPrev = 0 then  begin
       plano:=' null,'
    end else begin
       plano:= IntToStr(PlanoPrev)  +',';
    end;
    while not cdsIdadeSexo.eof do begin
      try
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add( 'INSERT INTO MPREVICDEMONESTIDSEX( '+
                        ' ENTIDADE,    '+
                        ' CNPJ,        '+
                        ' PLANOPREVIDENCIARIO, '+
                        ' ANOREFERENCIA, '+
                        ' MESREFERENCIA, '+
                        ' CATEGORIA,     '+
                        ' FAIXAIDADE,    '+
                        ' FEMININO,      '+
                        ' MASCULINO,     '+
                        ' CODIGOENTIDADE,  '+
                        ' CPAG,           '+
                        ' TRGUSERINCLUSAO, '+
                        ' TRGDTINCLUSAO   '+
                        ' ) VALUES ( '+
                        ' '''+qryEntidade.FieldByName('NOME').AsString +''','+
                        qryEntidade.FieldByName('CNPJ').AsString+','+
                        plano+
                        ' '''+ed_ano2.Text +''','+
                        ' '''+cdsIdadeSexo.FieldByName('MES').AsString +''','+
                        //' '''+qryEntidade.FieldByName('CODFUNDSPC').AsString+''','+
                        ' '''+cdsIdadeSexo.FieldByName('TIPO').AsString+''','+
                        ' '''+cdsIdadeSexo.FieldByName('DESCRICAO').AsString+''','+
                        cdsIdadeSexo.FieldByName('FEM').AsString+','+
                        cdsIdadeSexo.FieldByName('MASC').AsString+','+
                        ' '''+qryEntidade.FieldByName('CODFUNDSPC').AsString+''','+
                        IntToStr(cont)+','+
                        ' ''CM'+IntToStr(Sistema.IdUsuario)+''','+
                        ' SYSDATE)');


          qryAux.ExecSQL;
          cont:=cont+1;
          cdsIdadeSexo.next;
          CommitTransacao;
      except
             RollBackTransacao;
             MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
             Exit;
      end;

    end;
end;

procedure TfrmMapaPrevic.GeraXML;
var xml,FaixaEtaria :TStringList;
    cont :Integer;
begin
  //Monta a estrutura XML do Demonstrativo Sexo Idade
  try
      xml := TStringList.Create;
      FaixaEtaria := TStringList.Create;
      cdsIdadeSexo.First;

      FaixaEtaria.Add('ATE_24');
      FaixaEtaria.Add('ENTRE_25_34');
      FaixaEtaria.Add('ENTRE_35_54');
      FaixaEtaria.Add('ENTRE_55_64');
      FaixaEtaria.Add('ENTRE_65_74');
      FaixaEtaria.Add('ENTRE_75_84');
      FaixaEtaria.Add('MAIS_85');
      cont:=0;
      xml.Add('<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>   ');
      xml.Add('  <balancete-sexo-idade xmlns="http://sexoidadeporplano.xml.modelo.comum.estatistico.dataprev.gov.br"> ');
      xml.Add('  <entidade>'+ ed_codigo.Text +'</entidade> ');
      xml.Add('  <competencia>'+ ed_ano2.Text+ed_mes2.text+'</competencia>  ');
      xml.Add('  <email>'+ed_email.Text+'</email> ');

      while (not cdsIdadeSexo.Eof) do begin

         if (cdsIdadeSexo.FieldByName('planoprevidenciario').AsString = '')then
              xml.Add('  <consolidado> ')
         else if (cdsIdadeSexo.FieldByName('planoprevidenciario').AsInteger = 2)then
              xml.Add('  <plano-beneficio cnpb="1977000274"> ')
         else if (cdsIdadeSexo.FieldByName('planoprevidenciario').AsInteger = 66)then
              xml.Add('  <plano-beneficio cnpb="1998004465"> ')
         else if (cdsIdadeSexo.FieldByName('planoprevidenciario').AsInteger = 74)then
              xml.Add('  <plano-beneficio cnpb="2006003674"> ');

         if (cdsIdadeSexo.FieldByName('TIPO').AsString = 'Participante') then begin
             xml.Add('  <populacao-beneficio codigo-beneficio= "31000" > ');
             while (cdsIdadeSexo.FieldByName('TIPO').AsString = 'Participante')and(not cdsIdadeSexo.Eof)  do
             begin
                  xml.add('  <faixa-etaria tipo="'+ FaixaEtaria.Strings[cont] +'">');
                  xml.Add('  <masculino>'+ cdsIdadeSexo.FieldByName('MASC').AsString +'</masculino> ');
                  xml.Add('  <feminino>'+ cdsIdadeSexo.FieldByName('FEM').AsString +'</feminino> ');
                  xml.Add('  </faixa-etaria>   ');
                  cdsIdadeSexo.next;
                  cont :=cont+1;
             end;
             xml.Add('  </populacao-beneficio> ');
         end;
         cont:=0;
         if (cdsIdadeSexo.FieldByName('TIPO').AsString = 'Assistidos Aposentados') then begin
             xml.Add('  <populacao-beneficio codigo-beneficio= "32000">');
             while (cdsIdadeSexo.FieldByName('TIPO').AsString = 'Assistidos Aposentados') and(not cdsIdadeSexo.Eof) do begin
                 xml.Add('  <faixa-etaria tipo="'+FaixaEtaria.Strings[cont] +'">');
                 xml.Add('  <masculino>' + cdsIdadeSexo.FieldByName('MASC').AsString +'</masculino> ');
                 xml.Add('  <feminino>'+ cdsIdadeSexo.FieldByName('FEM').AsString +'</feminino> ');
                 xml.Add('  </faixa-etaria>   ');
                 cdsIdadeSexo.next;
                 cont :=cont+1;
             end;
             xml.Add('  </populacao-beneficio> ');
         end;
         cont:=0;
         if (cdsIdadeSexo.FieldByName('TIPO').AsString = 'Beneficiários de Pensão') then begin
              xml.Add('  <populacao-beneficio codigo-beneficio= "33000" > ');
              while (cdsIdadeSexo.FieldByName('TIPO').AsString = 'Beneficiários de Pensão')and(not cdsIdadeSexo.Eof) do begin
                  xml.Add('  <faixa-etaria tipo="'+FaixaEtaria.Strings[cont] +'">');
                  xml.Add('  <masculino>' + cdsIdadeSexo.FieldByName('MASC').AsString +'</masculino> ');
                  xml.Add('  <feminino>'+ cdsIdadeSexo.FieldByName('FEM').AsString +'</feminino> ');
                  xml.Add('  </faixa-etaria>   ');
                  cdsIdadeSexo.next;
                  cont :=cont+1;
              end;
              xml.Add('  </populacao-beneficio> ');
          end;

         if (cdsIdadeSexo.FieldByName('planoprevidenciario').AsInteger = 2)then
               xml.Add('  </consolidado> ')
         else if (cdsIdadeSexo.FieldByName('planoprevidenciario').AsInteger = 66)then
               xml.Add('  </plano-beneficio> ')
         else if (cdsIdadeSexo.FieldByName('planoprevidenciario').AsInteger = 74)then
               xml.Add('  </plano-beneficio> ');
          cont:=0;
      end;
      xml.Add('  </balancete-sexo-idade>');
      if sSemestre = '01'then
       sSemestre:= '1'
      else
       sSemestre:= '2';
      SDXML.FileName := ('DSI_'+ed_codigo.Text+'_'+ed_ano2.Text+'SEM'+sSemestre+'.xml');
      SDXML.Execute;
      xml.SaveToFile(SDXML.FileName);
  Finally
      xml.Destroy;
  end;
end;

procedure TfrmMapaPrevic.SpeedButton1Click(Sender: TObject);
var
   xml :String;
begin
  xml := xml+(' </balancete-sexo-idade>');
  SDXML.FileName := 'DSI_01523_201201.txt'+'.xml';
  SDXML.Execute;

end;

procedure TfrmMapaPrevic.bbtnConfirmarClick(Sender: TObject);
var
    qryconsolidado : TwwQuery;
    sSql           :String;
    flgplano :boolean;
begin
  inherited;



  if (ed_codigo.Text = '')then begin
    MsgDlg('É necessário preencher o campo com o Código da Entidade.', 'Informação', mtInformation, [mbOk], 0);
    exit;
  end;

  if (ed_email.Text = '')then begin
    MsgDlg('É necessário preencher o campo E-mail.', 'Informação', mtInformation, [mbOk], 0);
    exit;
  end;
  if ((cb_ana.Checked) or (cb_con1.Checked)) and (ed_ano1.Text = '')then begin
    MsgDlg('É necessário preencher o campo Ano de Referência.', 'Informação', mtInformation, [mbOk], 0);
    exit;
  end;

  if ((cb_ana.Checked) or (cb_con1.Checked)) and (cb_semestre.Text = '')then begin
    MsgDlg('É necessário preencher o campo Semestre de  Referência.', 'Informação', mtInformation, [mbOk], 0);
    exit;
  end;

  if (cb_con2.Checked) and (ed_mes2.Text = '')then begin
    MsgDlg('É necessário preencher o campo Mês de Referência.', 'Informação', mtInformation, [mbOk], 0);
    exit;
  end;
  if (cb_con2.Checked) and (ed_ano2.Text = '')then begin
    MsgDlg('É necessário preencher o campo Ano de Referência.', 'Informação', mtInformation, [mbOk], 0);
    exit;
  end;
  try
     if (cb_semestre.Text = '1º Semestre')then
       sSemestre := '01'
     else
      sSemestre := '02';

     qryEntidade.Close;
     qryEntidade.ParamByName('ENTIDADE').AsInteger := StrToInt(ed_codigo.text);
     qryEntidade.Prepare;
     qryEntidade.Open;

     execDemonstrativo := True;
     if MensagemAtualiza then begin
         if (MsgDlg('Já foram geradas informações para geração deste relatório, Deseja substituí-las?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
            execDemonstrativo := True
         else
            execDemonstrativo := False;
     end;

      qryconsolidado := TwwQuery.Create(Application);
      qryconsolidado.DatabaseName:= 'BaseDados';
      if (cb_con1.Checked) then begin
        sSql := 'SELECT * FROM MPREVICDEMONEST '+
                ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND TIPODEMONSTRATIVO = ''C'''+
                '       AND SEMESTREREFERENCIA = '+sSemestre +
                '       AND ANOREFERENCIA = '+ ed_ano1.Text;
        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        if cb_con1.Checked then begin
             if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
                 MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
             end else
             begin
                 if (not cb_reg.Checked)and (not cb_reb.Checked) and (not cb_novo.Checked) then
                     SelecionaPlanoPrev(True)
                 else
                    SelecionaPlanoPrev(False);

                 if not qryconsolidado.IsEmpty then
                 begin
                   if execDemonstrativo then begin
                      AbreConsulta('N','A');
                      AtualizaDadosDemonstrativoConsolidado;
                    end
                 end else begin
                       AbreConsulta('N','I');
                       GravaDemoConsolidado;
                 end;
             end;
          end;
      end;

      if (not cb_reg.Checked) and (not cb_reb.Checked) and (not cb_novo.Checked) then
         flgplano := true
      else
         flgplano := false;

     if cb_ana.Checked then begin
         SelecionaPlanoPrevMes(flgplano);
     end;

     if (cb_con2.Checked) then begin

        sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
                '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO is null '+
                '       AND ANOREFERENCIA = '+ed_ano2.text +
                '       AND MESREFERENCIA = '+ed_mes2.text;



        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;


        if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin
           if (not cb_reg.Checked)and (not cb_reb.Checked) and (not cb_novo.Checked) then
              SelecionaPlanoPrev(True)
           else
              SelecionaPlanoPrev(False);

           if cb_con2.Checked then begin
               if (not qryconsolidado.IsEmpty) then begin
                   if execDemonstrativo then begin
                     AbreConsultaIdadeSexo;
                     AtualizaSexoIdade(0);
                   end
               end else begin
                   AbreConsultaIdadeSexo;
                   GravaSexoIdade(0);
               end;
           end;
        end;
      end;

      if (cb_con2.Checked and (flgplano or cb_reg.Checked)) then begin

        sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
                '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 2 '+
                '       AND ANOREFERENCIA = '+ed_ano2.text +
                '       AND MESREFERENCIA = '+ed_mes2.text;

        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        CONTA11100ENT :=  '149,154,156,492,495,503,505,513,514';
        CONTA11200ENT :=  '159,504,521';
        CONTA14000ENT :=  '164,338,496,197,522,497';
        PLANOCONTAB   :=  '2,28';


        if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin

           if cb_con2.Checked then begin
               if (not qryconsolidado.IsEmpty) then begin
                   if execDemonstrativo then begin
                     AbreConsultaIdadeSexo;
                     AtualizaSexoIdade(2);
                   end
               end else begin
                   AbreConsultaIdadeSexo;
                   GravaSexoIdade(2);
               end;
           end;
        end;
      end;

      if (cb_con2.Checked and (flgplano or cb_reb.Checked)) then begin

        sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
                '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 66 '+
                '       AND ANOREFERENCIA = '+ed_ano2.text +
                '       AND MESREFERENCIA = '+ed_mes2.text;

        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        CONTA11100ENT := '151,152,318,320,864,863,869,870';
        CONTA11200ENT := '160,161,328,329,867,868';
        CONTA14000ENT := '165,171,278,324,325,326,865,866,497';
        PLANOCONTAB   :=  '66';

        if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin
           if cb_con2.Checked then begin
               if (not qryconsolidado.IsEmpty) then begin
                  if execDemonstrativo then begin
                     AbreConsultaIdadeSexo;
                     AtualizaSexoIdade(66);
                  end
               end else begin
                   AbreConsultaIdadeSexo;
                   GravaSexoIdade(66);
               end;
           end;
        end;
      end;

      if (cb_con2.Checked and (flgplano or cb_novo.Checked)) then begin

        sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
                '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 74 '+
                '       AND ANOREFERENCIA = '+ed_ano2.text +
                '       AND MESREFERENCIA = '+ed_mes2.text;

        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        CONTA11100ENT := '479,480,487,864,863,869,870';
        CONTA11200ENT := '481,867,868';
        CONTA14000ENT := '482,488,865,866,497';
        PLANOCONTAB   :=  '74,75';


        if not qryconsolidado.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin
           if cb_con2.Checked then begin
               if (not qryconsolidado.IsEmpty) then begin
                   if execDemonstrativo then begin
                     AbreConsultaIdadeSexo;
                     AtualizaSexoIdade(74);
                   end
               end else begin
                   AbreConsultaIdadeSexo;
                   GravaSexoIdade(74);
               end;
           end;
        end;
      end;
      if  cb_ana.Checked or cb_con1.Checked then
          GeraXMLDemoConsolidado;
      if cb_con2.Checked then
         GeraXMLSexoIdadeCadastrado(0);
  Finally
    qryconsolidado.Destroy;
  end;
end;

procedure TfrmMapaPrevic.GeraXMLDemons;
var
   xml :TStringList;
   mes: String;
   semes:string;
begin
  //Monta a estrutura do Demonstrativo em XML
  try
    xml := TStringList.Create;
    //qryIdadeSexo.First;
    cdsDemostrativo.First;
    if sSemestre = '01'then
       sSemestre:= '1'
    else
       sSemestre:= '2';

    xml.Add('<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>    ');
    xml.Add('  <balancetes-estatisticos xmlns="http://arquivosemestral.xml.modelo.comum.estatistico.dataprev.gov.br"> ');
    xml.Add('  <entidade>'+ ed_codigo.Text +'</entidade> ');
    xml.Add('  <ano>'+ ed_ano1.Text +'</ano>  ');
    xml.Add('  <semestre>'+sSemestre+'</semestre> ');
    xml.Add('  <email>'+ed_email.Text+'</email> ');
    xml.Add('  <balancete-estatistico mes= "'+cdsDemostrativo.FieldByName('Mes').AsString+'"> ');
    xml.Add('  <consolidado> ');
    mes := cdsDemostrativo.FieldByName('Mes').AsString;
    while (not cdsDemostrativo.Eof) and (cdsDemostrativo.FieldByName('Mes').AsString = mes) do
    begin
        while (cdsDemostrativo.FieldByName('Tipo').AsString = 'C') do begin
            xml.add('  <movimentacao codigo-beneficio="'+cdsDemostrativo.FieldByName('CONTA').AsString+'"> ');
            xml.add('  <inicial>'+cdsDemostrativo.FieldByName('Anterior').AsString+'</inicial> ');
            xml.add('  <entradas>'+cdsDemostrativo.FieldByName('Entrada').AsString+'</entradas> ');
            xml.add('  <saidas>'+cdsDemostrativo.FieldByName('Saida').AsString+'</saidas> ');
            xml.add('  </movimentacao> ');
            cdsDemostrativo.next;
        end;

        xml.Add('  </consolidado> ');
        xml.Add('  <plano-beneficio cnpb="1977000274"> ');

        while (cdsDemostrativo.FieldByName('Descricao').AsString = '2') do begin
            xml.add('  <movimentacao codigo-beneficio="'+cdsDemostrativo.FieldByName('CONTA').AsString+'"> ');
            xml.add('  <inicial>'+cdsDemostrativo.FieldByName('Anterior').AsString+'</inicial> ');
            xml.add('  <entradas>'+cdsDemostrativo.FieldByName('Entrada').AsString+'</entradas> ');
            xml.add('  <saidas>'+cdsDemostrativo.FieldByName('Saida').AsString+'</saidas> ');
            xml.add('  </movimentacao> ');
            cdsDemostrativo.next;
        end;
        xml.Add('  </plano-beneficio> ');
        xml.Add('  <plano-beneficio cnpb="1998004465"> ');
        while (cdsDemostrativo.FieldByName('Descricao').AsString = '66') do begin
            xml.add('  <movimentacao codigo-beneficio="'+cdsDemostrativo.FieldByName('CONTA').AsString+'"> ');
            xml.add('  <inicial>'+cdsDemostrativo.FieldByName('Anterior').AsString+'</inicial> ');
            xml.add('  <entradas>'+cdsDemostrativo.FieldByName('Entrada').AsString+'</entradas> ');
            xml.add('  <saidas>'+cdsDemostrativo.FieldByName('Saida').AsString+'</saidas> ');
            xml.add('  </movimentacao> ');
            cdsDemostrativo.next;
        end;
        xml.Add('  </plano-beneficio> ');
        xml.Add('  <plano-beneficio cnpb="2006003674"> ');
        while (not cdsDemostrativo.Eof) and (cdsDemostrativo.FieldByName('Descricao').AsString = '74')  do begin
            xml.add('  <movimentacao codigo-beneficio="'+cdsDemostrativo.FieldByName('CONTA').AsString+'"> ');
            xml.add('  <inicial>'+cdsDemostrativo.FieldByName('Anterior').AsString+'</inicial> ');
            xml.add('  <entradas>'+cdsDemostrativo.FieldByName('Entrada').AsString+'</entradas> ');
            xml.add('  <saidas>'+cdsDemostrativo.FieldByName('Saida').AsString+'</saidas> ');
            xml.add('  </movimentacao> ');
            cdsDemostrativo.next;
        end;

        if cdsDemostrativo.FieldByName('Mes').AsString <> mes then begin
            xml.Add('  </plano-beneficio>         ');
            xml.Add('  </balancete-estatistico> ');
            xml.Add('  <balancete-estatistico mes= "'+cdsDemostrativo.FieldByName('Mes').AsString+'"> ');
            xml.Add('  <consolidado>');
        end;
        mes := cdsDemostrativo.FieldByName('Mes').AsString;
    end;

    xml.Add(' </plano-beneficio> ');
    xml.Add(' </balancete-estatistico>');
    xml.Add(' </balancetes-estatisticos>');

    SDXML.FileName := ('EST_'+ed_codigo.Text+'_'+ed_ano1.Text+'SEM'+sSemestre+'.xml');
    SDXML.Execute;
    xml.SaveToFile(SDXML.FileName);
  Finally
    xml.Destroy;
  end;
end;

procedure TfrmMapaPrevic.AtualizaDadosDemonstrativo(PlanoPrev: integer);
var cont : integer;
begin
    cont:=0;
    cdsDemostrativo.First;
    StartTransacao;
    while not cdsDemostrativo.eof do begin
       try
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' UPDATE MPREVICDEMONEST SET  '+
                            '    DESCRICAOCONTA =      '+' '''+cdsDemostrativo.FieldByName('Descricao').AsString+''','+
                            '    VALORANTERIORCONTA    =    '+ cdsDemostrativo.FieldByName('ANTERIOR').AsString+','+
                            '    ENTRADA   =                '+ cdsDemostrativo.FieldByName('ENTRADA').AsString+','+
                            '    SAIDA     =                '+ cdsDemostrativo.FieldByName('SAIDA').AsString+','+
                            '    ATUAL     =                '+ cdsDemostrativo.FieldByName('ATUAL').AsString+','+
                            '    TIPOGRUPO =          '+  ' '''+ cdsDemostrativo.FieldByName('TIPO').AsString+''','+
                            '    TRGUSERINCLUSAO =        '+' ''CM'+IntToStr(Sistema.IdUsuario)+''','+
                            '    TRGDTINCLUSAO  =  SYSDATE '+
                            '  WHERE                    '+
                            '    CONTA  = ' + cdsDemostrativo.FieldByName('CONTA').AsString+' AND '+
                            '    CPAG  =                  '+IntToStr(cont)+' AND '+
                            '    PLANOPREVIDENCIARIO =      '+  IntToStr(PlanoPrev)  +' AND '+
                            '    CODIGOENTIDADE  =      '+   qryEntidade.FieldByName('CODFUNDSPC').AsString+' AND '+
                            '    SEMESTREREFERENCIA  =        '+ sSemestre+' AND '+
                            '    TIPODEMONSTRATIVO  =        '+ ' ''A'' AND '+
                            '    ANOREFERENCIA  =           '+ ' '''+ed_ano1.Text +''' AND '+
                            '    MESREFERENCIA  =  '+' '''+cdsDemostrativo.FieldByName('MES').AsString +'''');
          //qryAux.sql.SaveToFile('C:\UPDATEMPREVICDEMONEST.txt');
          qryAux.ExecSQL;
          cont:=cont+1;
          cdsDemostrativo.next;
          CommitTransacao;
       except
             RollBackTransacao;
             MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
             Exit;
       end;
    end;
end;

procedure TfrmMapaPrevic.AtualizaDadosDemonstrativoConsolidado;
var cont : integer;
begin
    cont:=0;
    cdsDemostrativo.First;
    StartTransacao;
    while not cdsDemostrativo.eof do begin
       try
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE MPREVICDEMONEST SET  '+

                          '    DESCRICAOCONTA =      '+' '''+cdsDemostrativo.FieldByName('Descricao').AsString+''','+
                          '    VALORANTERIORCONTA    =    '+ cdsDemostrativo.FieldByName('ANTERIOR').AsString+','+
                          '    ENTRADA   =                '+ cdsDemostrativo.FieldByName('ENTRADA').AsString+','+
                          '    SAIDA     =                '+ cdsDemostrativo.FieldByName('SAIDA').AsString+','+
                          '    ATUAL     =                '+ cdsDemostrativo.FieldByName('ATUAL').AsString+','+

                          '    TIPOGRUPO =          '+  ' '''+ cdsDemostrativo.FieldByName('TIPO').AsString+''','+
                          '    TRGUSERINCLUSAO =        '+' ''CM'+IntToStr(Sistema.IdUsuario)+''','+
                          '    TRGDTINCLUSAO  = SYSDATE'+
                          '  WHERE                    '+
                          '    CONTA  = ' + cdsDemostrativo.FieldByName('CONTA').AsString+' AND '+
                          '    CPAG  =                  '+IntToStr(cont)+' AND '+
                          '    CODIGOENTIDADE  =      '+    qryEntidade.FieldByName('CODFUNDSPC').AsString+' AND '+
                          '    SEMESTREREFERENCIA  =        '+ sSemestre+' AND '+
                          '    TIPODEMONSTRATIVO  =        '+ ' ''C'' AND '+
                          '    ANOREFERENCIA  =           '+ ' '''+ed_ano1.Text +''' AND  '+
                          '    MESREFERENCIA  =  '+' '''+cdsDemostrativo.FieldByName('MES').AsString +'''');
          //qryAux.sql.SaveToFile('C:\updateMPREVICDEMONEST.txt');
          qryAux.ExecSQL;
          cont:=cont+1;
          cdsDemostrativo.next;
          CommitTransacao;
       except
             RollBackTransacao;
             MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
             Exit;
       end;
    end;
end;

procedure TfrmMapaPrevic.AtualizaSexoIdade(PlanoPrev :integer);
var
  cont :integer;
  plano:string;
begin
    // Atualiza os dados do tabela MPREVICDEMONESTIDSEX caso queira substituir os valore anteriores
    if PlanoPrev = 0 then begin
       plano:=' PLANOPREVIDENCIARIO IS NULL AND '
    end else begin
       plano:= 'PLANOPREVIDENCIARIO ='+IntToStr(PlanoPrev)+' AND';
    end;

    cont:=0;
    cdsIdadeSexo.First;
    StartTransacao;

    while not cdsIdadeSexo.eof do begin
       try
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(  'UPDATE MPREVICDEMONESTIDSEX SET '+
                          ' FEMININO   =   '+ cdsIdadeSexo.FieldByName('FEM').AsString+' , '+
                          ' MASCULINO =     '+ cdsIdadeSexo.FieldByName('MASC').AsString+' , '+
                          ' CPAG  =           '+  IntToStr(cont)+','+
                          ' TRGUSERINCLUSAO = '+ ' ''CM'+IntToStr(Sistema.IdUsuario)+''','+
                          ' TRGDTINCLUSAO   = SYSDATE'+
                          ' WHERE '+
                          ' ENTIDADE =    '+  ' '''+qryEntidade.FieldByName('NOME').AsString +''' AND'+
                          ' CNPJ  =        '+ qryEntidade.FieldByName('CNPJ').AsString+' AND '+
                          ' ANOREFERENCIA = '+ ' '''+ed_ano2.Text +''' AND '+
                          ' MESREFERENCIA =  '+ ' '''+cdsIdadeSexo.FieldByName('MES').AsString +'''  AND '+
                          ' CATEGORIA =     '+ ' '''+cdsIdadeSexo.FieldByName('TIPO').AsString+'''  AND  '+
                          ' FAIXAIDADE =     '+  ' '''+cdsIdadeSexo.FieldByName('DESCRICAO').AsString+''' AND '+
                          plano+
                          ' CODIGOENTIDADE =  ' +qryEntidade.FieldByName('CODFUNDSPC').AsString+'  ');

          qryAux.ExecSQL;
          cont:=cont+1;
          cdsIdadeSexo.next;
          CommitTransacao;
       except
             RollBackTransacao;
             MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
             Exit;
       end;
    end;
end;

procedure TfrmMapaPrevic.SelecionaPlanoPrevMesXML(flgplano: boolean);
var
  mesinicio,mesfim :integer;
  qryValida : TwwQuery;
  sSql      : String;
begin
  try
    qryValida   := TwwQuery.Create(Application);
    qryValida.DatabaseName := 'BaseDados';

    if (cb_semestre.Text = '1º Semestre')then begin
        mesinicio := 1;
        mesfim :=6;
    end else begin
        mesinicio := 7;
        mesfim :=12;
    end;
    CONTA11100ENT := '';
    CONTA11200ENT := '';
    CONTA13000ENT := '';
    CONTA14000ENT := '';
    CONTA15000ENT := '';

    if cb_ana.Checked and (flgplano or cb_reg.Checked)then begin
        sSql := 'SELECT * FROM MPREVICDEMONEST '+
                ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 2'+
                '       AND TIPODEMONSTRATIVO = ''A'''+
                '       AND ANOREFERENCIA = '+ ed_ano1.Text+
                '       AND SEMESTREREFERENCIA = '+ sSemestre;
        qryValida.close;
        qryValida.SQL.Clear;
        qryValida.SQL.Add(sSql);
        qryValida.Prepare;
        qryValida.open;

        if not qryValida.FieldByName('NUMPROTOCOLO').IsNull then begin
           MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
        end else
        begin
          //Conta 11100   2
        if (cb_reg.Checked or flgPlano) then begin
             CONTA11100ENT :=  '149,154,156,492,495,503,505,513,514';
             CONTA11200ENT :=  '159,504,521';
             CONTA13000ENT :=  '506,507,508,509,515';
             CONTA14000ENT :=  '164,338,496,197,522,497';
             CONTA15000ENT :=  '499,500';
             PLANOCONTAB   :=  '2,28';

          if not (qryValida.IsEmpty) and (qryValida.FieldByName('ENTIDADE').AsString <> '') then begin
             if (MsgDlg('Já foram geradas informações para geração deste relatório, Deseja substituí-las?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
                qryPlanoPrev.close;
                qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '2';
                qryPlanoPrev.prepare;
                qryPlanoPrev.open;
                AbreConsulta('S','A');
                //GeraXMLDemons;
                //DeletaDemoConsilado('A',2);
                //GravarDadosDemonstrativo(2);

                AtualizaDadosDemonstrativo(2);
                MsgDlg('Os arquivos foram gerados com sucesso', 'Informação', mtInformation, [mbOk], 0)
             end else begin
                 GeraXMLDemoMesPlano2;
             end
          end else begin
            qryPlanoPrev.close;
            qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '2';
            qryPlanoPrev.prepare;
            qryPlanoPrev.open;
            AbreConsulta('S','I');
            //GeraXMLDemons;
            GravarDadosDemonstrativo(2);
            MsgDlg('Os arquivos foram gerados com sucesso', 'Informação', mtInformation, [mbOk], 0);
          end;
        end;
      end;
    end;

    if cb_ana.Checked then begin
        sSql := 'SELECT * FROM MPREVICDEMONEST '+
                ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 66'+
                '       AND TIPODEMONSTRATIVO = ''A'''+
                '       AND ANOREFERENCIA = '+ ed_ano1.Text+
                '       AND SEMESTREREFERENCIA = '+ sSemestre;
        qryValida.close;
        qryValida.SQL.Clear;
        qryValida.SQL.Add(sSql);
        qryValida.Prepare;
        qryValida.open;

      if qryValida.FieldByName('NUMPROTOCOLO').IsNull then begin
         MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
      end else
      begin
          //REB11100 =    66
          if (cb_reb.Checked or flgPlano) then begin
              CONTA11100ENT := '151,152,318,320,864,863,869,870';
              CONTA11200ENT := '160,161,328,329,867,868';
              CONTA13000ENT := '251,252,277,319,323,327,517,526';
              CONTA14000ENT := '165,171,278,324,325,326,865,866,497';
              CONTA15000ENT := '279,322,253,321';
              PLANOCONTAB   :=  '66';
              //end;
            if not (qryValida.IsEmpty) and (qryValida.FieldByName('ENTIDADE').AsString <> '') then begin
              if (MsgDlg('Já foram geradas informações para geração deste relatório, Deseja substituí-las?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
                  qryPlanoPrev.close;
                  qryPlanoPrev.ParamByName('IDPLANOPREV').AsString := '66';
                  qryPlanoPrev.prepare;
                  qryPlanoPrev.open;
                  AbreConsulta('S','A');
                  AtualizaDadosDemonstrativo(66);
                  MsgDlg('Os arquivos foram gerados com sucesso', 'Informação', mtInformation, [mbOk], 0);
              end else begin
               GeraXMLDemoMesPlano66;
               end
              end else begin
                qryPlanoPrev.close;
                  qryPlanoPrev.ParamByName('IDPLANOPREV').AsString := '66';
                  qryPlanoPrev.prepare;
                  qryPlanoPrev.open;
                  AbreConsulta('S','I');
                  //GeraXMLDemons;
                  GravarDadosDemonstrativo(66);
                  MsgDlg('Os arquivos foram gerados com sucesso', 'Informação', mtInformation, [mbOk], 0);
            end;
          end;
      end;
    end;
    if cb_ana.Checked then
    begin
        sSql := 'SELECT * FROM MPREVICDEMONEST '+
                ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 74'+
                '       AND TIPODEMONSTRATIVO = ''A'''+
                '       AND ANOREFERENCIA = '+ ed_ano1.Text+
                '       AND SEMESTREREFERENCIA = '+ sSemestre;

        qryValida.close;
        qryValida.SQL.Clear;
        qryValida.SQL.Add(sSql);
        qryValida.Prepare;
        qryValida.open;

       if not qryValida.FieldByName('NUMPROTOCOLO').IsNull then begin
             MsgDlg('Demonstrativo enviado à PREVIC! Não poderá ser alterado!', 'Informação', mtInformation, [mbOk], 0);
       end else
       begin
          //NovoPlano11100  74
          if (cb_novo.Checked or flgPlano) then
          begin
            {if (flgPlano)then  begin
                CONTA11100ENT :=  '149,154,156,492,495,503,505,513,514,151,152,318,320,479,480,487,864,863,869,870';
                CONTA11200ENT :=  '159,504,521,160,161,328,329,481,867,868';
                CONTA13000ENT :=  '506,507,508,509,515,251,252,277,319,323,327,517,526,483,484,518,520,528';
                CONTA14000ENT :=  '164,338,496,197,522,165,171,278,324,325,326,482,488,865,866';
                CONTA15000ENT :=  '253, 279, 321, 322,485,486,499,500'
            end
            else begin}
              CONTA11100ENT := '479,480,487,864,863,869,870';
              CONTA11200ENT := '481,867,868';
              CONTA13000ENT := '483,484,518,520,528';
              CONTA14000ENT := '482,488,865,866,497';
              CONTA15000ENT := '499,500';
              PLANOCONTAB   := '74,75';
            //end;
              if not (qryValida.IsEmpty) and (qryValida.FieldByName('ENTIDADE').AsString <> '') then begin
                if (MsgDlg('Já foram geradas informações para geração deste relatório, Deseja substituí-las?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
                    qryPlanoPrev.close;
                    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
                    qryPlanoPrev.prepare;
                    qryPlanoPrev.open;
                    AbreConsulta('S','A');
                    //GeraXMLDemons;
                    //DeletaDemoConsilado('A',74);
                    //GravarDadosDemonstrativo(74);
                    AtualizaDadosDemonstrativo(74);
                    MsgDlg('Os arquivos foram gerados com sucesso', 'Informação', mtInformation, [mbOk], 0);
                end else begin
                  GeraXMLDemoMesPlano74;
                end
              end else
              begin
                  qryPlanoPrev.close;
                  qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
                  qryPlanoPrev.prepare;
                  qryPlanoPrev.open;
                  AbreConsulta('S','I');
                  //GeraXMLDemons;
                  GravarDadosDemonstrativo(74);
                  MsgDlg('Os arquivos foram gerados com sucesso', 'Informação', mtInformation, [mbOk], 0);
              end;
          end;
       end;
    end;
  Finally
    qryValida.Destroy;
  end;
end;
procedure TfrmMapaPrevic.FormShow(Sender: TObject);
begin
  inherited;
   qryEntidade.Close;
   qryEntidade.ParamByName('ENTIDADE').AsInteger := 01523;
   qryEntidade.Prepare;
   qryEntidade.Open;
   //   qryEntidade.open;
   ed_codigo.text := qryEntidade.fieldByName('CODFUNDSPC').AsString;
   ed_email.text  := qryEntidade.fieldByName('EMAIL').AsString;
   ed_ano1.Text := (FormatDateTime('YYYY',now));
   ed_ano2.Text := (FormatDateTime('YYYY',now));
   cb_semestre.ItemIndex :=0;
end;

procedure TfrmMapaPrevic.GeraXMLSexoIdadeCadastrado(PlanoPrev :integer);
var
  Plano:string;
  sSQL:String;
begin
 if PlanoPrev = 0 then
       plano:=' IS NULL '
    else
       plano:='  = ' + IntToStr(PlanoPrev);

{  sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
          '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
          '       AND PLANOPREVIDENCIARIO '+ Plano+
          '       AND ANOREFERENCIA = '+ed_ano2.text +
          '       AND MESREFERENCIA = '+ed_mes2.text+
          ' ORDER BY CPAG   ';    }

  sSql := ' SELECT *     '+
          '  FROM  MPREVICDEMONESTIDSEX    '+
          ' WHERE CODIGOENTIDADE         = '+  ed_codigo.text +
          '   AND  ANOREFERENCIA         = '+ ed_ano2.text +
          '       AND MESREFERENCIA      = '+ed_mes2.text+
          ' ORDER BY mesreferencia, '+
          '  decode(planoprevidenciario,null,0,2,1,66,2,74,3), '+
          '  decode(categoria,                    '+
          '        ''Participante'',              '+
          '        ''A'',                         '+
          '        ''Assistidos Aposentados'',    '+
          '        ''B'',                         '+
          '        ''Beneficiários de Pensão'',   '+
          '        ''C''),                        '+
          ' CPAG ';




  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;

  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsSexoIdade.Open;

    while not qryVisualizarDemo.Eof do begin

        cdsIdadeSexo.Append;
        cdsIdadeSexo.FieldByName('TIPO').AsString      :=  qryVisualizarDemo.FieldByName('CATEGORIA').AsString;
        cdsIdadeSexo.FieldByName('DESCRICAO').AsString :=  qryVisualizarDemo.FieldByName('FAIXAIDADE').AsString;
        cdsIdadeSexo.FieldByName('FEM').AsInteger      :=  qryVisualizarDemo.FieldByName('FEMININO').AsInteger;
        cdsIdadeSexo.FieldByName('MASC').AsInteger     :=  qryVisualizarDemo.FieldByName('MASCULINO').AsInteger;
        cdsIdadeSexo.FieldByName('PLANOPREVIDENCIARIO').AsString     :=  qryVisualizarDemo.FieldByName('PLANOPREVIDENCIARIO').AsString;
        cdsIdadeSexo.post;
        qryVisualizarDemo.next;
    end;
    cdsIdadeSexo.First;
    GeraXML;
  end;
end;

procedure TfrmMapaPrevic.ed_mes2Change(Sender: TObject);
begin
  if (ed_mes2.Text <> '') then begin
    if (StrToInt(ed_mes2.Text) >12) or (StrToInt(ed_mes2.Text) < 0) then
       ed_mes2.Text:='';
    end;
end;

procedure TfrmMapaPrevic.GeraXMLDemoConsolidado;
  var sSQL:String;
begin
{  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ MontaSelectEstatistico.ValoresChave[1]+
          ' AND TIPODEMONSTRATIVO     = ''C'''+
          ' AND	ANOREFERENCIA           = '+ MontaSelectEstatistico.ValoresChave[3]+
          ' AND SEMESTREREFERENCIA      = '+ MontaSelectEstatistico.ValoresChave[4]+
          ' ORDER BY CPAG ';}


  {sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ ed_codigo.Text+
          ' AND TIPODEMONSTRATIVO     = ''C'''+
          ' AND	ANOREFERENCIA           = '+ ed_ano1.Text+
          ' AND SEMESTREREFERENCIA      = '+ sSemestre+
          ' ORDER BY CPAG ';  }

   sSQL := ' SELECT *                       '+
           '  FROM MPREVICDEMONEST          '+
           ' WHERE CODIGOENTIDADE     = '+ ed_codigo.Text+
           '   AND  ANOREFERENCIA     = '+ ed_ano1.Text+
           '   AND Semestrereferencia =  '+ sSemestre+
           ' ORDER BY mesreferencia, tipodemonstrativo desc, planoprevidenciario,CPAG ';



  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsDemons.Open;
    while not qryVisualizarDemo.Eof do begin
        cdsDemostrativo.Append;
        cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
        qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

        cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPODEMONSTRATIVO').AsString;//qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
        cdsDemostrativo.FieldByName('CONTA').AsString :=  qryVisualizarDemo.fieldByName('CONTA').AsString;
        cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('planoprevidenciario').AsString;//passa o plano para gerar xml
        cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
        cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
        cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
        cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
        cdsDemostrativo.post;
        qryVisualizarDemo.next;
    end;
    qryVisualizarDemo.First;
    qryPlanoPrev.close;
    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
    qryPlanoPrev.prepare;
    qryPlanoPrev.open;
    GeraXMLDemons;
  end;
end;

procedure TfrmMapaPrevic.GeraXMLDemoMesPlano2;
var sSQL:String;
begin
  // Gera O Arquivo XML para o Plano 2
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ ed_codigo.Text+
          ' AND PLANOPREVIDENCIARIO     = 2 '+
          ' AND	ANOREFERENCIA           = '+ ed_ano1.Text+
          //' AND SEMESTREREFERENCIA      = '+ MontaSelectEstatistico.ValoresChave[4]+
          ' ORDER BY CPAG ';


  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsDemons.Open;

    while not qryVisualizarDemo.Eof do begin
        cdsDemostrativo.Append;
        cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
        qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Tipo').AsString            :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
        cdsDemostrativo.FieldByName('Descricao').AsString       :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
        cdsDemostrativo.FieldByName('MES').AsString             :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Entrada').AsInteger        :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
        cdsDemostrativo.FieldByName('SAIDA').AsInteger          :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
        cdsDemostrativo.FieldByName('ATUAL').AsInteger          :=  qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
        cdsDemostrativo.FieldByName('Anterior').AsInteger       :=  qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
        cdsDemostrativo.post;
        qryVisualizarDemo.next;

    end;
    qryVisualizarDemo.First;
    cdsDemostrativo.First;
    qryPlanoPrev.close;
    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '2';
    qryPlanoPrev.prepare;
    qryPlanoPrev.open;
    GeraXMLDemons;
  end;
end;

procedure TfrmMapaPrevic.GeraXMLDemoMesPlano66;
var sSQL:String;
begin
  // Gera O Arquivo XML para o Plano 66
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ ed_codigo.Text+
          ' AND PLANOPREVIDENCIARIO     = 66'+
          ' AND	ANOREFERENCIA           = '+ ed_ano1.Text+
          //' AND SEMESTREREFERENCIA      = '+ MontaSelectEstatistico.ValoresChave[4]+
          ' ORDER BY CPAG ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;

  if (not qryVisualizarDemo.IsEmpty) then
  begin
     CMSqlParamsDemons.Open;

      while not qryVisualizarDemo.Eof do begin
          cdsDemostrativo.Append;
          cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
          qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

          cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
          cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
          cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
          cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
          cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
          cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
          cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          cdsDemostrativo.post;
          qryVisualizarDemo.next;
      end;
      qryVisualizarDemo.First;
      qryPlanoPrev.close;
      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '66';
      qryPlanoPrev.prepare;
      qryPlanoPrev.open;
      GeraXMLDemons;
  end;
end;

procedure TfrmMapaPrevic.GeraXMLDemoMesPlano74;
var sSQL:String;
begin
  // Gera O Arquivo XML para o Plano 74
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ ed_codigo.Text+
          ' AND PLANOPREVIDENCIARIO     = 74'+
          ' AND	ANOREFERENCIA           = '+ ed_ano1.Text+
         // ' AND SEMESTREREFERENCIA      = '+sSemestre+
          ' ORDER BY CPAG ';

      

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
      CMSqlParamsDemons.Open;
      while not qryVisualizarDemo.Eof do begin
          cdsDemostrativo.Append;
          cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
          qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

          cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
          cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
          cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
          cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
          cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
          cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
          cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          cdsDemostrativo.post;
          qryVisualizarDemo.next;
      end;
      qryVisualizarDemo.First;
      qryPlanoPrev.close;
      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
      qryPlanoPrev.prepare;
      qryPlanoPrev.open;
      GeraXMLDemons;
  end;
end;

procedure TfrmMapaPrevic.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //Faz os campos voltarem para default
  cb_ana.Checked := false;
  cb_con1.Checked := false;
  cb_con2.Checked := false;
  cbDemoEstatistico.Checked := false;
  cbDemoSexoIdade.Checked := false;
  cb_reg.Checked := false;
  cb_reb.Checked := false;
  cb_novo.Checked := false;

  qryEntidade.Close;
  qryEntidade.ParamByName('ENTIDADE').AsInteger := 01523;
  qryEntidade.Prepare;
  qryEntidade.Open;
  ed_codigo.text := qryEntidade.fieldByName('CODFUNDSPC').AsString;
  ed_email.text  := qryEntidade.fieldByName('EMAIL').AsString;
  ed_ano1.Text := (FormatDateTime('YYYY',now));
  ed_ano2.Text := (FormatDateTime('YYYY',now));
  cb_semestre.ItemIndex := 0;
  ed_mes2.Text := '';
end;

procedure TfrmMapaPrevic.ed_ano1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If not( key in['0'..'9',#08] ) then
     key:=#0;
end;

procedure TfrmMapaPrevic.ed_mes2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 If not( key in['0'..'9',#08] ) then
     key:=#0;
end;

procedure TfrmMapaPrevic.ed_ano2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 If not( key in['0'..'9',#08] ) then
     key:=#0;
end;

procedure TfrmMapaPrevic.MonstraDemoConsolidado;
  var sSQL:String;
begin
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ ed_codigo.Text+
          ' AND TIPODEMONSTRATIVO     = ''C'''+
          ' AND	ANOREFERENCIA           = '+ ed_ano1.Text+
          ' AND SEMESTREREFERENCIA      = '+ sSemestre+
          ' ORDER BY CPAG ';



  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsDemons.Open;
    while not qryVisualizarDemo.Eof do begin
        cdsDemostrativo.Append;
        cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
        qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

        cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
        cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
        cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
        cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
         if qryVisualizarDemo.fieldByName('ATUAL').AsInteger <0 then
                cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('ATUAL').AsInteger := qryVisualizarDemo.fieldByName('ATUAL').AsInteger;


        if qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger <0 then
                cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
        //cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
        //cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
        cdsDemostrativo.post;
        qryVisualizarDemo.next;
    end;
    qryVisualizarDemo.First;
    qryPlanoPrev.close;
    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
    qryPlanoPrev.prepare;
    qryPlanoPrev.open;

    pedtEntidade.Text := qryVisualizarDemo.fieldByName('CODIGOENTIDADE').AsString + ' - '+qryVisualizarDemo.FieldByName('ENTIDADE').AsString;
    ppLabel10.Caption := 'CNPJ: ';  // Alterado pela Monica -  SOL 231507 - Para mudar a Flag para CNPJ quando o demostrativo for consolidade.
    pedtCNPJ.Text := '00.436.923/0001-90';//FormataCNPJ(qryVisualizarDemo.FieldByName('CNPJ').AsString);
    pedtPeriodo.Text := qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
    if (qryVisualizarDemo.fieldByName('MESREFERENCIA').AsInteger < 7)then
      //pedtPeriodo.Text := '01'+pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
      pedtPeriodo.Text := pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
    else
      pedtPeriodo.Text := pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
      //pedtPeriodo.Text := '01'+pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

    TFrmPreview.CreateModalPreview(Application, pDemonstrativoEstatistico,'Demonstrativo Consolidado');
  end;
end;

procedure TfrmMapaPrevic.MonstraDemoMesPlano2;
var sSQL:String;
begin
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ ed_codigo.Text+
          ' AND PLANOPREVIDENCIARIO     = 2 '+
          ' AND	ANOREFERENCIA           = '+ ed_ano1.Text+
          ' AND SEMESTREREFERENCIA      = '+ sSemestre+
          ' ORDER BY CPAG ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsDemons.Open;

    while not qryVisualizarDemo.Eof do begin
        cdsDemostrativo.Append;
        cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
        qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Tipo').AsString            :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
        cdsDemostrativo.FieldByName('Descricao').AsString       :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
        cdsDemostrativo.FieldByName('MES').AsString             :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
        cdsDemostrativo.FieldByName('Entrada').AsInteger        :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
        cdsDemostrativo.FieldByName('SAIDA').AsInteger          :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;


         if qryVisualizarDemo.fieldByName('ATUAL').AsInteger <0 then
                cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('ATUAL').AsInteger := qryVisualizarDemo.fieldByName('ATUAL').AsInteger;


        if qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger <0 then
                cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
        else
            cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;

        //cdsDemostrativo.FieldByName('ATUAL').AsInteger          :=  qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
        //cdsDemostrativo.FieldByName('Anterior').AsInteger       :=  qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
        cdsDemostrativo.post;
        qryVisualizarDemo.next;

    end;
    qryVisualizarDemo.First;
    cdsDemostrativo.First;
    qryPlanoPrev.close;
    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '2';
    qryPlanoPrev.prepare;
    qryPlanoPrev.open;

    pedtEntidade.Text := qryVisualizarDemo.fieldByName('CODIGOENTIDADE').AsString + ' - '+qryVisualizarDemo.FieldByName('ENTIDADE').AsString;
    ppLabel10.Text := 'Plano: ';   
    pedtCNPJ.Text := qryPlanoPrev.FieldByName('CNPB').AsString + ' - ' + qryPlanoPrev.FieldByName('NOME').AsString;

    pedtPeriodo.Text := qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
    if (qryVisualizarDemo.fieldByName('MESREFERENCIA').AsInteger < 7)then
      pedtPeriodo.Text := pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
    else
      pedtPeriodo.Text := pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

    TFrmPreview.CreateModalPreview(Application, pDemonstrativoEstatistico,qryPlanoPrev.FieldByName('NOME').AsString);
  end;
end;

procedure TfrmMapaPrevic.MonstraDemoMesPlano66;
var sSQL:String;
begin
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ ed_codigo.Text+
          ' AND PLANOPREVIDENCIARIO     = 66'+
          ' AND	ANOREFERENCIA           = '+ ed_ano1.Text+
          ' AND SEMESTREREFERENCIA      = '+ sSemestre+
          ' ORDER BY CPAG ';


  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;

  if (not qryVisualizarDemo.IsEmpty) then
  begin
     CMSqlParamsDemons.Open;

      while not qryVisualizarDemo.Eof do begin
          cdsDemostrativo.Append;
          cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
          qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

          cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
          cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
          cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
          cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
          cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;

          if qryVisualizarDemo.fieldByName('ATUAL').AsInteger <0 then
                cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0
          else
              cdsDemostrativo.FieldByName('ATUAL').AsInteger := qryVisualizarDemo.fieldByName('ATUAL').AsInteger;


          if qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger <0 then
                  cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
          else
              cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          //cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
          //cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          cdsDemostrativo.post;
          qryVisualizarDemo.next;
      end;
      qryVisualizarDemo.First;
      qryPlanoPrev.close;
      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '66';
      qryPlanoPrev.prepare;
      qryPlanoPrev.open;

      pedtEntidade.Text := qryVisualizarDemo.fieldByName('CODIGOENTIDADE').AsString + ' - '+qryVisualizarDemo.FieldByName('ENTIDADE').AsString;
      ppLabel10.Text := 'Plano: ';     
      pedtCNPJ.Text := qryPlanoPrev.FieldByName('CNPB').AsString + ' - ' + qryPlanoPrev.FieldByName('NOME').AsString;

      pedtPeriodo.Text := qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
      if (qryVisualizarDemo.fieldByName('MESREFERENCIA').AsInteger < 7)then
        pedtPeriodo.Text := pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
      else
        pedtPeriodo.Text := pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

      TFrmPreview.CreateModalPreview(Application, pDemonstrativoEstatistico,qryPlanoPrev.FieldByName('NOME').AsString);
  end;
end;

procedure TfrmMapaPrevic.MonstraDemoMesPlano74;
var sSQL:String;
begin
  sSQL := ' SELECT * FROM MPREVICDEMONEST '+
          ' WHERE CODIGOENTIDADE        = '+ ed_codigo.Text+
          ' AND PLANOPREVIDENCIARIO     = 74'+
          ' AND	ANOREFERENCIA           = '+ ed_ano1.Text+
          ' AND SEMESTREREFERENCIA      = '+ sSemestre+
          ' ORDER BY CPAG ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;
  if (not qryVisualizarDemo.IsEmpty) then
  begin
      CMSqlParamsDemons.Open;
      while not qryVisualizarDemo.Eof do begin
          cdsDemostrativo.Append;
          cdsDemostrativo.FieldByName('Referencia').AsString :=  'Referência '+qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString + '/'+
          qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

          cdsDemostrativo.FieldByName('Tipo').AsString :=  qryVisualizarDemo.fieldByName('TIPOGRUPO').AsString;
          cdsDemostrativo.FieldByName('Descricao').AsString :=  qryVisualizarDemo.fieldByName('DescricaoConta').AsString;
          cdsDemostrativo.FieldByName('MES').AsString :=  qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString;
          cdsDemostrativo.FieldByName('Entrada').AsInteger :=  qryVisualizarDemo.fieldByName('ENTRADA').AsInteger;
          cdsDemostrativo.FieldByName('SAIDA').AsInteger :=  qryVisualizarDemo.fieldByName('SAIDA').AsInteger;
          if qryVisualizarDemo.fieldByName('ATUAL').AsInteger <0 then
                cdsDemostrativo.FieldByName('ATUAL').AsInteger := 0
          else
            cdsDemostrativo.FieldByName('ATUAL').AsInteger := qryVisualizarDemo.fieldByName('ATUAL').AsInteger;


          if qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger <0 then
                cdsDemostrativo.FieldByName('Anterior').AsInteger := 0
          else
            cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;

          //cdsDemostrativo.FieldByName('ATUAL').AsInteger :=   qryVisualizarDemo.fieldByName('ATUAL').AsInteger;
          //cdsDemostrativo.FieldByName('Anterior').AsInteger := qryVisualizarDemo.fieldByName('VALORANTERIORCONTA').AsInteger;
          cdsDemostrativo.post;
          qryVisualizarDemo.next;
      end;
      qryVisualizarDemo.First;
      qryPlanoPrev.close;
      qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  '74';
      qryPlanoPrev.prepare;
      qryPlanoPrev.open;

      pedtEntidade.Text := qryVisualizarDemo.fieldByName('CODIGOENTIDADE').AsString + ' - '+qryVisualizarDemo.FieldByName('ENTIDADE').AsString;
      ppLabel10.Caption := 'Plano: ';
      pedtCNPJ.Text := qryPlanoPrev.FieldByName('CNPB').AsString + ' - ' + qryPlanoPrev.FieldByName('NOME').AsString;

      pedtPeriodo.Text := qryVisualizarDemo.fieldByName('MESREFERENCIA').AsString+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;
      if (qryVisualizarDemo.fieldByName('MESREFERENCIA').AsInteger < 7)then
        pedtPeriodo.Text := pedtPeriodo.Text +' a '+'06'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString
      else
        pedtPeriodo.Text := pedtPeriodo.Text +' a '+'12'+'/'+qryVisualizarDemo.fieldByName('ANOREFERENCIA').AsString;

      TFrmPreview.CreateModalPreview(Application, pDemonstrativoEstatistico,qryPlanoPrev.FieldByName('NOME').AsString);
  end;
end;

procedure TfrmMapaPrevic.MonstraDemoSexoIdade(PlanoPrev :integer);
var sSQL,plano:String;
begin
  if PlanoPrev = 0 then
       plano:=' IS NULL '
  else
       plano:='  = ' + IntToStr(PlanoPrev);

  sSQL := ' SELECT * FROM  MPREVICDEMONESTIDSEX '+
          ' WHERE ANOREFERENCIA =   '+ed_ano2.Text+
          ' AND CODIGOENTIDADE =    '+ ed_codigo.Text+
          ' AND MESREFERENCIA = '+ed_mes2.text+
          ' AND PLANOPREVIDENCIARIO' +plano+
          ' ORDER BY CPAG   ';

  qryVisualizarDemo.Close;
  qryVisualizarDemo.SQL.Clear;
  qryVisualizarDemo.SQL.Add(sSQL);
  qryVisualizarDemo.Prepare;
  qryVisualizarDemo.open;
  qryVisualizarDemo.First;

  if (not qryVisualizarDemo.IsEmpty) then
  begin
    CMSqlParamsSexoIdade.Open;

    while not qryVisualizarDemo.Eof do begin

        cdsIdadeSexo.Append;
        cdsIdadeSexo.FieldByName('TIPO').AsString      :=  qryVisualizarDemo.FieldByName('CATEGORIA').AsString;
        cdsIdadeSexo.FieldByName('DESCRICAO').AsString :=  qryVisualizarDemo.FieldByName('FAIXAIDADE').AsString;
        cdsIdadeSexo.FieldByName('FEM').AsInteger      :=  qryVisualizarDemo.FieldByName('FEMININO').AsInteger;
        cdsIdadeSexo.FieldByName('MASC').AsInteger     :=  qryVisualizarDemo.FieldByName('MASCULINO').AsInteger;
        cdsIdadeSexo.post;
        qryVisualizarDemo.next;
    end;
    cdsIdadeSexo.First;
    qryVisualizarDemo.First;
    qryPlanoPrev.close;
    qryPlanoPrev.ParamByName('IDPLANOPREV').AsString :=  IntToStr(PlanoPrev);
    qryPlanoPrev.prepare;
    qryPlanoPrev.open;


    pedtAnoReferenciaIdadeSexo.Text :=qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString;
    pedtEntidadeIdadeSexo.Text := qryEntidade.FieldByName('CODFUNDSPC').AsString + ' - '+qryEntidade.FieldByName('NOME').AsString;
    if PlanoPrev = 0 then
       begin
        pedtCNPJIdadeSexo.Text := '00.436.923/0001-90'; // FormataCNPJ(qryVisualizarDemo.FieldByName('CNPJ').AsString)//qryVisualizarDemo.FieldByName('CNPJ').AsString
        ppLabel3.Caption := 'CNPJ: '; // Alterado pela Monica -  SOL 231507 - Para mudar a Flag para CNPJ quando o demostrativo for consolidade.
        end
    else begin
        ppLabel3.Caption := 'Plano: ';
        pedtCNPJIdadeSexo.Text := qryPlanoPrev.FieldByName('CNPB').AsString + ' - ' + qryPlanoPrev.FieldByName('NOME').AsString;// qryVisualizarDemo.FieldByName('CNPJ').AsString;
     end;
    pedtPeriodoIdadeSexc.Text := qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString+' a '+qryVisualizarDemo.FieldByName('ANOREFERENCIA').AsString;

    if PlanoPrev = 0 then
        TFrmPreview.CreateModalPreview(Application, pDemostrativoSexoIdade,'Demonstrativo DSI')
    else
        TFrmPreview.CreateModalPreview(Application, pDemostrativoSexoIdade,'Demonstrativo DSI - '+qryPlanoPrev.FieldByName('NOME').AsString);
   end;
end;

function TfrmMapaPrevic.FormataCNPJ(CNPJ: string): string;
begin
     Result :=Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2);
end;

procedure TfrmMapaPrevic.DeletaDemoConsilado(Tipodemo : String; PlanoPrev :Integer);
var vSql:String;
begin
  try
     qryDelete.close;
     qryDelete.sql.Clear;
     vSql := qryDeleteAux.SQL.Text;
     vSql := StringReplace(vSql,':ANOREFERENCIA',QuotedStr(ed_ano1.text),[rfReplaceAll, rfIgnoreCase]);
     vSql := StringReplace(vSql,':SEMESTREREFERENCIA',QuotedStr(sSemestre),[rfReplaceAll, rfIgnoreCase]);
     vSql := StringReplace(vSql,':TIPODEMONSTRATIVO',QuotedStr(Tipodemo),[rfReplaceAll, rfIgnoreCase]);
     if planoPrev <> 0 then
          vSql := vSql + ' AND PLANOPREVIDENCIARIO = '+ IntToStr(PlanoPrev);

     qryDelete.SQL.Add(vSql);
     qryDelete.Prepare;
     qryDelete.ExecSQL;
     {
     qryDelete.close;
     qryDelete.sql.Clear;
     qryDelete.ParamByName('ANOREFERENCIA').AsString :=  QuotedStr(ed_ano1.Text);
     qryDelete.ParamByName('SEMESTREREFERENCIA').AsString :=  QuotedStr(sSemestre);
     qryDelete.ParamByName('TIPODEMONSTRATIVO').AsString :=  QuotedStr(Tipodemo);
     qryDelete.ExecSQL;   }

     CommitTransacao;
  except
     RollBackTransacao;
     MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
     Exit;
  end;

end;

procedure TfrmMapaPrevic.DeletaDemoSexoIdade(PlanoPrev : integer);
var plano,vSql:String;
begin
  try
    if PlanoPrev = 0 then  begin
       plano:= 'IS null'
    end else begin
       plano:= ' = '+ IntToStr(PlanoPrev) ;
    end;
     qryDeleteSexo.close;
     qryDeleteSexo.sql.Clear;
     vSql := qryDeleteSexoAux.SQL.Text;
     vSql := StringReplace(vSql,':PLANOPREVIDENCIARIO',Plano,[rfReplaceAll, rfIgnoreCase]);
     vSql := StringReplace(vSql,':ANOREFERENCIA',QuotedStr(ed_ano2.Text),[rfReplaceAll, rfIgnoreCase]);
     vSql := StringReplace(vSql,':MESREFERENCIA',QuotedStr(ed_mes2.Text),[rfReplaceAll, rfIgnoreCase]);
     qryDeleteSexo.SQL.Add(vSql);

     qryDeleteSexo.Prepare;
     qryDeleteSexo.ExecSQL;
     CommitTransacao;
  except
     RollBackTransacao;
     MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
     Exit;
  end;

end;

function TfrmMapaPrevic.MensagemAtualiza: Boolean;
var executar, flgplano : boolean;
    qryconsolidado : TwwQuery;
    sSql : string;
begin
    qryconsolidado := TwwQuery.Create(Application);
    qryconsolidado.DatabaseName:= 'BaseDados';

    if (not cb_reg.Checked) and (not cb_reb.Checked) and (not cb_novo.Checked) then
    flgplano := true
    else
    flgplano := false;

    executar := False;
    if (cb_con1.Checked) then begin
      sSql := 'SELECT * FROM MPREVICDEMONEST '+
              ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
              '       AND TIPODEMONSTRATIVO = ''C'''+
              '       AND SEMESTREREFERENCIA = '+sSemestre +
              '       AND ANOREFERENCIA = '+ ed_ano1.Text;
      qryconsolidado.close;
      qryconsolidado.SQL.Clear;
      qryconsolidado.SQL.Add(sSql);
      qryconsolidado.Prepare;
      qryconsolidado.open;

    if not qryconsolidado.IsEmpty then
       executar:= True;
    end;

     if (cb_con2.Checked) then begin

      sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
              '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
              '       AND PLANOPREVIDENCIARIO is null '+
              '       AND ANOREFERENCIA = '+ed_ano2.text +
              '       AND MESREFERENCIA = '+ed_mes2.text;

      qryconsolidado.close;
      qryconsolidado.SQL.Clear;
      qryconsolidado.SQL.Add(sSql);
      qryconsolidado.Prepare;
      qryconsolidado.open;

      if not qryconsolidado.IsEmpty then
         executar:= True;
    end;


    if (cb_con2.Checked and (flgplano or cb_reg.Checked)) then begin

      sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
              '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
              '       AND PLANOPREVIDENCIARIO = 2 '+
              '       AND ANOREFERENCIA = '+ed_ano2.text +
              '       AND MESREFERENCIA = '+ed_mes2.text;

      qryconsolidado.close;
      qryconsolidado.SQL.Clear;
      qryconsolidado.SQL.Add(sSql);
      qryconsolidado.Prepare;
      qryconsolidado.open;

      if not qryconsolidado.IsEmpty then
         executar:= True;

    end;


    if (cb_con2.Checked and (flgplano or cb_reb.Checked)) then begin

      sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
              '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
              '       AND PLANOPREVIDENCIARIO = 66 '+
              '       AND ANOREFERENCIA = '+ed_ano2.text +
              '       AND MESREFERENCIA = '+ed_mes2.text;

      qryconsolidado.close;
      qryconsolidado.SQL.Clear;
      qryconsolidado.SQL.Add(sSql);
      qryconsolidado.Prepare;
      qryconsolidado.open;

      if not qryconsolidado.IsEmpty then
         executar:= True;

    end;


    if (cb_con2.Checked and (flgplano or cb_novo.Checked)) then begin

      sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
              '       WHERE CODIGOENTIDADE = '+ ed_codigo.text +
              '       AND PLANOPREVIDENCIARIO = 74 '+
              '       AND ANOREFERENCIA = '+ed_ano2.text +
              '       AND MESREFERENCIA = '+ed_mes2.text;

      qryconsolidado.close;
      qryconsolidado.SQL.Clear;
      qryconsolidado.SQL.Add(sSql);
      qryconsolidado.Prepare;
      qryconsolidado.open;

      if not qryconsolidado.IsEmpty then
         executar:= True;
    end;


    if cb_ana.Checked and (flgplano or cb_reg.Checked)then begin
      sSql := 'SELECT * FROM MPREVICDEMONEST '+
              ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
              '       AND PLANOPREVIDENCIARIO = 2'+
              '       AND TIPODEMONSTRATIVO = ''A'''+
              '       AND ANOREFERENCIA = '+ ed_ano1.Text+
              '       AND SEMESTREREFERENCIA = '+ sSemestre;
      qryconsolidado.close;
      qryconsolidado.SQL.Clear;
      qryconsolidado.SQL.Add(sSql);
      qryconsolidado.Prepare;
      qryconsolidado.open;

      if not qryconsolidado.IsEmpty then
       executar:= True;
    end;



    if cb_ana.Checked then begin
        sSql := 'SELECT * FROM MPREVICDEMONEST '+
                ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
                '       AND PLANOPREVIDENCIARIO = 66'+
                '       AND TIPODEMONSTRATIVO = ''A'''+
                '       AND ANOREFERENCIA = '+ ed_ano1.Text+
                '       AND SEMESTREREFERENCIA = '+ sSemestre;
        qryconsolidado.close;
        qryconsolidado.SQL.Clear;
        qryconsolidado.SQL.Add(sSql);
        qryconsolidado.Prepare;
        qryconsolidado.open;

        if not qryconsolidado.IsEmpty then
           executar:= True;
    end;

    if cb_ana.Checked then
    begin
      sSql := 'SELECT * FROM MPREVICDEMONEST '+
              ' WHERE CODIGOENTIDADE = '+ ed_codigo.text +
              '       AND PLANOPREVIDENCIARIO = 74'+
              '       AND TIPODEMONSTRATIVO = ''A'''+
              '       AND ANOREFERENCIA = '+ ed_ano1.Text+
              '       AND SEMESTREREFERENCIA = '+ sSemestre;

      qryconsolidado.close;
      qryconsolidado.SQL.Clear;
      qryconsolidado.SQL.Add(sSql);
      qryconsolidado.Prepare;
      qryconsolidado.open;

      if not qryconsolidado.IsEmpty then
         executar:= True;
     end;
    qryconsolidado.Destroy;
    Result := Executar;
end;

end.
