(*******************************************************************************
 Analista Responsável: André C. Tavares
 - implementado em 26/04/2002 a  28/04/2002
 Alterações: 04/04/2004 - andré Tavares - pendência 16653
*******************************************************************************)

unit FConfigRelRubs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands,
  ppCache, dRelCentralAP;

type
  TfrmConfigRelRubs = class(TfrmOkCancelar)
    TipoRubs: TRadioGroup;
    DataIni: TCMDateTimePicker;
    Label1: TLabel;
    RdgSelecao: TRadioGroup;
    MSParticipDepen: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigRelRubs: TfrmConfigRelRubs;

implementation


{$R *.DFM}

procedure TfrmConfigRelRubs.FormCreate(Sender: TObject);
begin
  inherited;
  DataIni.text := '';
end;

procedure TfrmConfigRelRubs.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   dtmRelCentralAP.qryFun.Open;
   dtmRelCentralAP.QryRelaRubsPendentes.Close;
   dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text :=
   ' SELECT '+#13#10+
         ' DISTINCT SR.IDRUBS, '+#13#10+
         ' EL.MATRICULA, '+#13#10+
         ' RB.IDPESSOA, '+#13#10+
         ' P.NOME, '+#13#10+
         ' IDBENEFICIO, '+#13#10+
         ' SR.NOME AS SERVICO_BENEFICIO, '+#13#10+
         ' DOC.NOMEDOCUMENTO, '+#13#10+
         ' SP.DESCRICAO, '+#13#10+
         ' TEL.DDD, '+#13#10+
         ' TEL.NUMERO, '+#13#10+
         ' HL.DATAMOV '+#13#10+
         ' FROM PESSOA P, ELEGPATRO EL, RUBXBENEFICIO RB, HISTMOVRUBS HL, '+#13#10+
         ' DOCUMENTOS DOC, PARTPREVPLAN PRP, SITPART SP, ENDPESS EP,  TELENDPESS TEL, (  '+#13#10+
         '                                SELECT '+#13#10+
         '                                   DISTINCT TD.NOMEDOCUMENTO, '+#13#10+
         '                                   TD.IDDOCUMENTO, '+#13#10+
         '                                   TP.FLGRECEBIDO, '+#13#10+
         '                                   TP.FLGRECEBIDO AS OLDFLGRECEBIDO, '+#13#10+
         '                                   TP.DATARECEB, '+#13#10+
         '                                   TP.IDTIPODOCXRUB, '+#13#10+
         '                                   TP.IDRUBXBENEFICIO, '+#13#10+
         '                                   R.IDRUBS, '+#13#10+
         '                                   R.DATAGERACAO, '+#13#10+
         '                                   R.IDASSUNTOXATEND,'+#13#10+
         '                                   ATEND.IDBENEFICIARIO, '+#13#10+
         '                                   BS.NOME AS NOME '+#13#10+
         '                                FROM '+#13#10+
         '                                   TIPODOCXRUB TP, '+#13#10+
         '                                   DOCUMENTOS TD, '+#13#10+
         '                                   RUBXBENEFICIO RX, '+#13#10+
         '                                   RUBS R, '+#13#10+
         '                                   ATEND, '+#13#10+
         '                                   ASSUNTOXATEND ASSATEND, '+#13#10+
         '                                   ( '+#13#10+
         '                                          SELECT '+#13#10+
         '                                               SE.IDSERVICOS AS IDBENEFICIO, '+#13#10+
         '                                               SE.NOME AS NOME '+#13#10+
         '                                           FROM SERVICO SE '+#13#10+
         '                                           UNION '+#13#10+
         '                                           SELECT '+#13#10+
         '                                                BE.IDBENEFICIO AS IDBENEFICIO, '+#13#10+
         '                                                BE.NOME AS NOME '+#13#10+
         '                                           FROM  BENEFICIO BE '+#13#10+
         '                                   ) BS '+#13#10+
         ' WHERE '+#13#10+
         ' (FLGRECEBIDO = ''N'') AND '+#13#10+
         ' (TP.IDDOCUMENTO = TD.IDDOCUMENTO) AND '+#13#10+
         ' (RX.IDRUBXBENEFICIO = TP.IDRUBXBENEFICIO) AND  '+#13#10+
         ' (R.IDRUBS = RX.IDRUBS) AND '+#13#10+
         ' (R.IDASSUNTOXATEND = ASSATEND.IDASSUNTOXATEND(+)) AND '+#13#10+
         ' (ATEND.IDATEND(+) = ASSATEND.IDASSUNTOXATEND) AND '+#13#10+
         ' (BS.IDBENEFICIO = RX.IDBENEFICIO) '+#13#10+
         ' ) SR '+#13#10+
         ' WHERE SR.IDRUBS = RB.IDRUBS AND '+#13#10+
         '       EL.IDPESSOA = RB.IDPESSOA AND '+#13#10+
         '       P.IDPESSOA = RB.IDPESSOA AND'+#13#10+
         '       SR.IDDOCUMENTO = DOC.IDDOCUMENTO AND '+#13#10+
         '       RB.IDPESSOA = PRP.IDPESSOA AND '+#13#10+
         '       PRP.IDSITPART = SP.IDSITPART AND '+#13#10+
         '       RB.IDPESSOA = EP.IDPESSOA(+) AND '+#13#10+
         '       TEL.IDENDERECO(+) = EP.IDENDERECO AND'+#13#10+
         '       RB.IDRUBS = HL.IDRUBS(+) AND '+#13#10+
// Início - André Tavares - 16653 - Início -------------------------------------
         '       PRP.FLGDESATIVADO(+) = 0 AND '+#13#10+
         '       EP.IDENDERECO = P.IDENDCORRESP AND '+#13#10+
         '       TEL.IDTELEFONE(+) = EP.IDENDERECO AND '+#13#10+
         '       RB.IDRUBS = HL.IDRUBS(+) '+#13#10;
// Início - André Tavares - 16653 - Fim ----------------------------------------



  case RdgSelecao.ItemIndex of
     // pega um participante/Dependente/elegível para verificar as RUBS pendentes
     0 : begin
         MSParticipDepen.Executar;
         if MSParticipDepen.RetornouValor then
         begin
           dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text := dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text + ' AND EL.MATRICULA = :MATRICULA '+#13#10;
           dtmRelCentralAP.QryRelaRubsPendentes.ParamByName('matricula').asString := MSParticipDepen.ValoresChave[2];
         end;
     end;
     1 : begin
     end;

  end; // case


  case TipoRubs.ItemIndex of
     0 : ;
     // RUBS DE RECADASTRAMENTO
     1 : Begin
           dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text := dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text +
           ' AND SR.DATAGERACAO IS NOT NULL '+#13#10;
           dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text := dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text +
           ' AND SR.IDASSUNTOXATEND IS NULL '+#13#10;
         end;
  end; //case


 if DataIni.Text <> '' then
 begin
   dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text := dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text + ' AND HL.DATAMOV >= :DATAMOVIMENTO '+#13#10;
   dtmRelCentralAP.QryRelaRubsPendentes.ParamByName('DATAMOVIMENTO').asDate := DataIni.Date;
 end;
 dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text := dtmRelCentralAP.QryRelaRubsPendentes.Sql.Text + ' ORDER BY sr.idrubs ';
 dtmRelCentralAP.QryRelaRubsPendentes.Open;
end;

end.
