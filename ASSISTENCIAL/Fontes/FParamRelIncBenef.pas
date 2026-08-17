unit FParamRelIncBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, DBCtrls,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin, Wwdatsrc, ppDB, ppDBPipe,
  ppDBBDE, ppModule, raCodMod, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport;

type
  TfrmParamIncBenef = class(TfrmOkCancelar)
    dblcpatro: TCMDBLookupCombo;
    Label2: TLabel;
    qrypatro: TwwQuery;
    dblcparticip: TCMDBLookupCombo;
    Label1: TLabel;
    qryParticip: TwwQuery;
    rpincbenef: TppReport;
    ppincbenef: TppBDEPipeline;
    dsincbenef: TwwDataSource;
    qryincbenef: TwwQuery;
    qrypatroIDPESSOA: TFloatField;
    qrypatroNOME: TStringField;
    qryParticipIDPESSOA: TFloatField;
    qryParticipNOME: TStringField;
    ppFundacao: TppBDEPipeline;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppHeaderBand23: TppHeaderBand;
    ppDBImage19: TppDBImage;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppLabel113: TppLabel;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText193: TppDBText;
    ppDBText194: TppDBText;
    ppLine34: TppLine;
    ppLine36: TppLine;
    ppLabel100: TppLabel;
    ppDetailBand21: TppDetailBand;
    ppDBText195: TppDBText;
    ppDBTextTitular: TppDBText;
    ppDBText197: TppDBText;
    ppDBText196: TppDBText;
    ppDBText199: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLabelNomeSistema: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppLabelTotalT: TppLabel;
    ppLabel116: TppLabel;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppLabel120: TppLabel;
    ppDBText198: TppDBText;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel112: TppLabel;
    ppLabel114: TppLabel;
    ppLabel118: TppLabel;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLabelTotal: TppLabel;
    qryincbenefIDPESSOA: TFloatField;
    qryincbenefTITULAR: TStringField;
    qryincbenefPATROCINADORA: TStringField;
    qryincbenefPLANO: TStringField;
    qryincbenefDATAENTRADA: TDateTimeField;
    qryincbenefMATRICULA: TStringField;
    qryincbenefINSCRICAO: TFloatField;
    qryincbenefDATAINSCRICAO: TDateTimeField;
    qryincbenefSITUACAO: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblcpatroChange(Sender: TObject);
    procedure dblcpatroExit(Sender: TObject);
    procedure ppSummaryBand5BeforePrint(Sender: TObject);
    procedure ppDetailBand21AfterPrint(Sender: TObject);
  private
    { Private declarations }
    Procedure Fazqry;
    Procedure Msg(Tp:Char);

  public
    { Public declarations }
  end;

var
  frmParamIncBenef: TfrmParamIncBenef;
  sPart  : String[60];
  sPatro : String[60];
  Total,
  TotalT : Integer;

implementation

{$R *.DFM}

uses dRelAssistencial, usistema, UMensErro;

Procedure TfrmParamIncBenef.Fazqry;
Var sSql: String;
begin
  with {dtmRelAssistencial.}qryIncBenef do
  begin
    close;
    sql.clear;
    sSql:='SELECT PT.IDPESSOA, '+
          'UPPER(PT.NOME) AS TITULAR, '+
          'RTRIM(PJ.NOME) AS PATROCINADORA, '+
          'PL.NOME AS PLANO, '+
          'BF.DATAENTRADA, '+
          'EL.MATRICULA AS MATRICULA, '+
          'PP.INSCRICAONUMERO AS INSCRICAO, '+
          'PS.DATAENTRADA AS DATAINSCRICAO, '+
          'DECODE(ST.FLGINTERNO,''AS'',''ASSISTIDO'' , '+
                               '''CA'',''CANCELADO'', '+
                               '''MA'',''MANTIDO'', '+
                               '''AT'',''ATIVO'') AS SITUACAO '+
          'FROM'+
          ' PESSOA PT,'+
          ' PESSOA PJ,'+
          ' PESSOAFISICA PF,'+
          ' PARTPREVPLAN PP,'+
          ' ELEGPATRO EL,'+
          ' SITPART ST,'+
          ' DEPENTIT DP,'+
          ' PARTASS PS,'+
          ' BENEFASS BF,'+
          ' PLANASS PL '+

          'WHERE';
          If sPart<>'' then sSql:=sSql+' (PT.IDPESSOA='+sPart+') AND ';
          sSql:=sSql+
          ' (PT.IDPESSOA=PF.IDPESSOA) AND'+
          ' (PT.IDPESSOA=PT.IDPESSOA) AND'+
          ' (PT.IDPESSOA=PP.IDPESSOA) AND'+

          ' (PT.IDPESSOA=EL.IDPESSOA) AND'+
          ' (PT.IDPESSOA=BF.IDTITULAR) AND'+
          ' (PT.IDPESSOA=PS.IDPESSOA) AND'+
          ' (PT.IDPESSOA=DP.IDTITULAR) AND';

          If sPatro<>'' then sSql:=sSql+' (PJ.IDPESSOA='+sPatro+') AND ';
          sSql:=sSql+
          ' (PJ.IDPESSOA=PP.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=PJ.IDPESSOA) AND'+
          ' (PJ.IDPESSOA=EL.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=PS.IDPESSJUR) AND'+
          ' (PJ.IDPESSOA=BF.IDPESSJUR) AND'+

          ' (PP.IDPESSJUR=PS.IDPESSJUR)AND'+
          ' (PP.IDPESSOA=PP.IDPESSOA) AND'+
          ' (PP.IDSITPART=ST.IDSITPART) AND'+
          ' (PP.IDPLANOPREV=PS.IDPLANOPREV) AND'+

          ' (EL.IDPESSJUR=PS.IDPESSJUR) AND'+

          ' (PS.IDPESSOA=BF.IDTITULAR) AND'+

          ' (BF.IDPLANASS=PS.IDPLANASS) AND'+
          ' (BF.DTCANCELAMENTO IS NULL) AND'+
          ' (BF.IDPLANASS=PL.IDPLANASS)'+

          ' ORDER BY PATROCINADORA, TITULAR';
    sql.add(sSql);

    open;
  end;
end;

procedure TfrmParamIncBenef.Msg(Tp:Char);
Var Ms: String[80];
begin
  Case Tp Of
    '1' : Ms:='Escolha a Patrocinadora!';
    '2' : Ms:='Será emitido um Relatório Geral!';
  end;
  If MsgDlg(Ms,'Alerta', mtError,[mbOk,mbCancel,mbHelp],0) = mrCancel then
   If Tp='2' then sPatro:='0';
end;

procedure TfrmParamIncBenef.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sPart:='';
  sPatro:='';
  TotalT:=0;
  If dblcparticip.LookupValue<>'' then sPart:=dblcparticip.LookupValue;
  If dblcPatro.LookupValue<>'' then sPatro:=dblcPatro.LookupValue;
  If (Spart<>'')And(sPatro='') then Msg('1')
  else
  If ((SPart<>'')And(sPatro<>''))Or((SPart='')And(sPatro<>'')) then FazQry
  else
   If (Spart='')And(sPatro='') then
   begin
     Msg('2');
     If sPatro='0' then Exit
     else FazQry;
   end;
   qryFundacao.Open;

//rpincbenef.print;
   qryFundacao.Close;
   qryIncBenef.Close;
end;

procedure TfrmParamIncBenef.FormShow(Sender: TObject);
begin
  inherited;
  qrypatro.open;
  qryParticip.open;
end;

procedure TfrmParamIncBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrypatro.Close;
  qryParticip.Close;
end;

procedure TfrmParamIncBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblcpatro.LookupValue:='';
  dblcParticip.LookupValue:='';
end;

procedure TfrmParamIncBenef.dblcpatroChange(Sender: TObject);
begin
  inherited;
  dblcParticip.LookupValue:='';

end;

procedure TfrmParamIncBenef.dblcpatroExit(Sender: TObject);
begin
  inherited;
  With qryParticip do
  begin
    Close;
    Sql.clear;
    Sql.Add('SELECT P.IDPESSOA, P.NOME '+
            'FROM PESSOA P, PARTASS PS '+
            'WHERE (PS.IDPESSOA=P.IDPESSOA ) AND '+
            '(P.IDPESSOA=P.IDPESSOA) AND '+
            '(PS.IDPESSOA=PS.IDPESSOA) AND '+
            '(PS.IDPESSJUR='+qryPatro.FieldByName('Idpessoa').AsString+') '+
            'ORDER BY P.NOME');
    Open;
  end;
end;

procedure TfrmParamIncBenef.ppSummaryBand5BeforePrint(Sender: TObject);
begin
  inherited;
  ppLabelTotalT.Caption:='Quantidade Total de Titulares: '+IntToStr(TotalT);   
end;

procedure TfrmParamIncBenef.ppDetailBand21AfterPrint(Sender: TObject);
begin
  inherited;
  Inc(Total,1);
  Inc(TotalT,1);
  ppLabelTotal.Caption:='Total da Patrocinadora => '+IntToStr(Total);
end;

end.

