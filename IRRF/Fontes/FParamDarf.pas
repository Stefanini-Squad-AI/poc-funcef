unit FParamDarf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook;

type
  TfrmParamDarf = class(TfrmOkCancelar)
    rgImpresso: TRadioGroup;
    gbDatas: TGroupBox;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    lblNatureza: TLabel;
    dblcNatureza: TwwDBLookupCombo;
    qryRendimento: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamDarf: TfrmParamDarf;

implementation

Uses DRelatIRRF,uSistema;
{$R *.DFM}

procedure TfrmParamDarf.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   with dtmRelatIRRF.qryDarf do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT D.IDDARF,                   ');
      SQL.Add('       D.IDPESSOA,                 ');
      SQL.Add('       D.CODNATUREZA,              ');
      SQL.Add('       D.NUMDOCUMENTO,             ');
      SQL.Add('       D.REFERENCIA,               ');
      SQL.Add('       D.PROCESSO,                 ');
      SQL.Add('       D.DATAINIAPURACAO,          ');
      SQL.Add('       D.DATAFINALAPURACAO,        ');
      SQL.Add('       D.DATAVENCDARF,             ');
      SQL.Add('       D.DATAPAGTODARF,            ');
      SQL.Add('       D.VLRBASECALCULO,           ');
      SQL.Add('       D.PERCIRRF,                 ');
      SQL.Add('       D.VLRIRRF,                  ');
      SQL.Add('       D.VLRMULTA,                 ');
      SQL.Add('       D.VLRJUROS,                 ');
      SQL.Add('       D.VLRTOTAL,                 ');
      SQL.Add('       D.OBSDARF,                  ');
      SQL.Add('       D.FLGIMPRESSO,              ');
      SQL.Add('       D.CODDOCUMENTO,             ');
      SQL.Add('       D.NUMLANCMULTA,             ');
      SQL.Add('       D.NUMLANCJUROS,             ');
      SQL.Add('       D.DATAEMISDARF,             ');
      SQL.Add('       P.RAZAOSOCIAL,              ');
      SQL.Add('       T.NUMERO AS TELEFONE        ');
      SQL.Add('FROM PESSOA P,                                ');
      SQL.Add('     TELENDPESS T,                            ');
      SQL.Add('     DARF D,                                  ');
      SQL.Add('     (SELECT MAX(T.IDTELEFONE) AS IDTELEFONE  ');
      SQL.Add('      FROM PESSOA P,                          ');
      SQL.Add('           TELENDPESS T                       ');
      SQL.Add('      WHERE (P.IDPESSOA = :pIDEMPRESA)        ');
      SQL.Add('        AND (P.IDENDCOMERCIAL = T.IDENDERECO) ');
      SQL.Add('        AND (T.TIPO LIKE ''%C%'' )) TM        ');
      SQL.Add('WHERE (D.IDPESSOA = :pIDEMPRESA)              ');
      SQL.Add('  AND (P.IDPESSOA = :pIDEMPRESA)              ');
      SQL.Add('  AND (D.IDPESSOA = P.IDPESSOA)               ');
      SQL.Add('  AND (P.IDENDCOMERCIAL = T.IDENDERECO(+))    ');
      SQL.Add('  AND (T.IDTELEFONE = TM.IDTELEFONE(+))       ');
      if rgImpresso.ItemIndex = 0 then begin
         SQL.Add('  AND ((D.FLGIMPRESSO IS NULL) OR             ');
         SQL.Add('       (D.FLGIMPRESSO = ''N''))               ');
      end else begin
         SQL.Add('  AND (D.FLGIMPRESSO = ''S'')                 ');
      end;
      if trim(deDataIni.Text) <> '' then
         SQL.Add('  AND (D.DATAEMISDARF >= TO_DATE('''+trim(deDataIni.Text)+''',''DD/MM/YYYY'')) ');
      if trim(deDataFim.Text) <> '' then
         SQL.Add('  AND (D.DATAEMISDARF <= TO_DATE('''+trim(deDataFim.Text)+''',''DD/MM/YYYY'')) ');
      if trim(dblcNatureza.LookupValue) <> '' then
         SQL.Add('  AND (D.CODNATUREZA = '''+dblcNatureza.LookupValue+''') ');
      SQL.Add(' ORDER BY D.IDDARF ');

      ParamByName('pIDEMPRESA').Value:=Sistema.IdEmpresa;
      Open;
   end;
end;

procedure TfrmParamDarf.FormActivate(Sender: TObject);
begin
  inherited;
  qryRendimento.Close;
  qryRendimento.Open;
end;

end.




