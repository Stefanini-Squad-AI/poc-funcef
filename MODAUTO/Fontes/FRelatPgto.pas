unit FRelatPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls,  wwdblook, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, StdCtrls;

type
  TfrmRelatPgto = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    dbcContrato: TwwDBLookupCombo;
    gbDatasProgramadas: TGroupBox;
    Label2: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    rdDatas: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    dbcFavorecido: TwwDBLookupCombo;
    dbcProcesso: TwwDBLookupCombo;
    qryContrato: TwwQuery;
    qryProcesso: TwwQuery;
    qryFavorecido: TwwQuery;
    qryContratoNOMECONTRATO: TStringField;
    qryContratoIDCONTRATO: TFloatField;
    qryFavorecidoIDFORCLI: TFloatField;
    qryFavorecidoRAZAOSOCIAL: TStringField;
    qryProcessoCODCONTRATOEMPR: TStringField;
    rdPgtoRec: TRadioGroup;
    procedure rdDatasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatPgto: TfrmRelatPgto;

implementation

uses DRelatoriosContrato,USistema;

{$R *.DFM}

procedure TfrmRelatPgto.rdDatasClick(Sender: TObject);
begin
  inherited;
  if rdDatas.ItemIndex = 1 then
     begin
       gbDatasProgramadas.Enabled := true;
       dtInicio.Color := clWindow;
       dtFim.Color := clWindow;
     end
  else
     begin
       gbDatasProgramadas.Enabled := false;
       dtInicio.Color := clgray;
       dtFim.Color := clgray;
     end;
end;

procedure TfrmRelatPgto.FormActivate(Sender: TObject);
begin
  inherited;
  qryContrato.Close;
  qryContrato.ParamByName('IDUSUARIO').AsString := IntToStr(Sistema.IDUsuario);
  qryContrato.Open;
  //
  qryProcesso.Close;
  qryProcesso.ParamByName('IDUSUARIO').AsString := IntToStr(Sistema.IDUsuario);
  qryProcesso.Open;
  //
  qryFavorecido.Close;
  qryFavorecido.ParamByName('IDUSUARIO').AsString := IntToStr(Sistema.IDUsuario);
  qryFavorecido.Open;
  //
  gbDatasProgramadas.Enabled := true;                                
  dtInicio.Color := clWindow;
  dtFim.Color := clWindow;
end;

procedure TfrmRelatPgto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatoriosContrato.qryEmpresa.Close;
  dtmRelatoriosContrato.qryEmpresa.ParamByName('idEmpresa').Value := Sistema.IdEmpresa;
  dtmRelatoriosContrato.qryEmpresa.Open;
  dtmRelatoriosContrato.rpNomeEmpresaPgto.Caption := dtmRelatoriosContrato.qryEmpresaRAZAOSOCIAL.AsString;
  //
  dtmRelatoriosContrato.qryPgto.Close;
  dtmRelatoriosContrato.qryPgto.SQL.Clear;
  dtmRelatoriosContrato.qryPgto.SQL.add('SELECT /*+ FIRST_ROWS */ C.CODCONTRATOEMPR,C.NOMECONTRATO,P.RAZAOSOCIAL,');
  dtmRelatoriosContrato.qryPgto.SQL.add('     D.NODOCUMENTO||DECODE(D.COMPLDOCUMENTO,'''','' '',''/'')||D.COMPLDOCUMENTO AS DOC,');
  dtmRelatoriosContrato.qryPgto.SQL.add('     D.DATAPROGRAMADA,L.DATALANCTO,R.NUMCHQBORDERO,D.OBS,');
  dtmRelatoriosContrato.qryPgto.SQL.add('     DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR,(L.VALOR*-1)),DECODE(L.DEBCRE,''C'',L.VALOR,(L.VALOR*-1))) VALOR ');
  dtmRelatoriosContrato.qryPgto.SQL.add('FROM CONTRATOCONTR C,MEDICAO M,PARCELAMEDICAO PM,');
  dtmRelatoriosContrato.qryPgto.SQL.add('     DOCUMENTO D,LANCTODOCUM L,PESSOA P,RECBTOPAGTO R ');
  dtmRelatoriosContrato.qryPgto.SQL.add('WHERE (C.IDCONTRATO = M.IDCONTRATO)');
  dtmRelatoriosContrato.qryPgto.SQL.add(' AND (M.IDMEDICAO = PM.IDMEDICAO)');
  dtmRelatoriosContrato.qryPgto.SQL.add(' AND (PM.CODDOCUMENTO = D.CODDOCUMENTO)');
  dtmRelatoriosContrato.qryPgto.SQL.add(' AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
  dtmRelatoriosContrato.qryPgto.SQL.add(' AND (D.IDFORCLI = P.IDPESSOA)');
  dtmRelatoriosContrato.qryPgto.SQL.add(' AND (L.NUMLANCTO = R.NUMLANCTO)');
  dtmRelatoriosContrato.qryPgto.SQL.add(' AND (D.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+')');
  dtmRelatoriosContrato.qryPgto.SQL.add(' AND (L.OPERACAO = ''5 '')');
  dtmRelatoriosContrato.qryPgto.SQL.add(' AND (L.ESTORNO IS NULL) ');
  //
  if dbcContrato.LookupValue <> '' then
     begin
       dtmRelatoriosContrato.qryPgto.SQL.add(' AND (C.IDCONTRATO = :IDCONTRATO) ');
       dtmRelatoriosContrato.qryPgto.ParamByName('IDCONTRATO').AsFloat := qryContratoIDCONTRATO.AsFloat;
     end;
  if dbcProcesso.LookupValue <> '' then
     begin
       dtmRelatoriosContrato.qryPgto.SQL.add(' AND (C.CODCONTRATOEMPR = :CODCONTRATOEMPR) ');
       dtmRelatoriosContrato.qryPgto.ParamByName('CODCONTRATOEMPR').AsString := qryProcessoCODCONTRATOEMPR.AsString;
     end;
  if dbcFavorecido.LookupValue <> '' then
     begin
       dtmRelatoriosContrato.qryPgto.SQL.add(' AND (C.IDFORCLI = :IDFORCLI) ');
       dtmRelatoriosContrato.qryPgto.ParamByName('IDFORCLI').AsFloat := qryFavorecidoIDFORCLI.AsFloat;
     end;
  if (rdDatas.ItemIndex = 1) and (Trim(dtInicio.Text) <> '') and (Trim(dtFim.Text) <> '') then
     begin
       dtmRelatoriosContrato.qryPgto.SQL.add(' AND (D.DATAPROGRAMADA BETWEEN :DTINICIO AND :DTFIM) ');
       dtmRelatoriosContrato.qryPgto.ParamByName('DTINICIO').AsDate := dtInicio.Date;
       dtmRelatoriosContrato.qryPgto.ParamByName('DTFIM').AsDate := dtFim.Date;
     end;
  //
  case rdPgtoRec.ItemIndex of
   0 :begin
      dtmRelatoriosContrato.qryPgto.SQL.add(' AND (D.RECPAG = ''P'') ');
      dtmRelatoriosContrato.ppTitPagtoRec.Caption := 'Relatório de Pagamentos';
      end;
   1 :begin
      dtmRelatoriosContrato.qryPgto.SQL.add(' AND (D.RECPAG = ''R'') ');
      dtmRelatoriosContrato.ppTitPagtoRec.Caption := 'Relatório de Recebimentos';
      end;
  end;
  //
  dtmRelatoriosContrato.qryPgto.SQL.add('ORDER BY D.DATAPROGRAMADA, P.RAZAOSOCIAL');
//  dtmRelatoriosContrato.qryPgto.SQL.SaveTofile('C:\sql.txt');
  dtmRelatoriosContrato.qryPgto.Open;
end;

end.

{SELECT /*+ FIRST_ROWS */ C.CODCONTRATOEMPR,C.NOMECONTRATO,P.RAZAOSOCIAL,
     D.NODOCUMENTO||DECODE(D.COMPLDOCUMENTO,'',' ','/')||D.COMPLDOCUMENTO AS DOC,
     D.DATAPROGRAMADA,L.DATALANCTO,R.NUMCHQBORDERO,D.OBS,
     DECODE(D.RECPAG,'P',DECODE(L.DEBCRE,'D',L.VALOR,(L.VALOR*-1)),DECODE(L.DEBCRE,'C',L.VALOR,(L.VALOR*-1))) VALOR
FROM CONTRATOCONTR C,MEDICAO M,PARCELAMEDICAO PM,
     DOCUMENTO D,LANCTODOCUM L,PESSOA P,RECBTOPAGTO R
WHERE (C.IDCONTRATO = M.IDCONTRATO)
 AND (M.IDMEDICAO = PM.IDMEDICAO)
 AND (PM.CODDOCUMENTO = D.CODDOCUMENTO)
 AND (D.CODDOCUMENTO = L.CODDOCUMENTO)
 AND (D.IDFORCLI = P.IDPESSOA)
 AND (L.NUMLANCTO = R.NUMLANCTO)
 AND (D.IDPESSOA = 1)
 AND (L.OPERACAO = '5 ')
 AND (L.ESTORNO IS NULL)}
