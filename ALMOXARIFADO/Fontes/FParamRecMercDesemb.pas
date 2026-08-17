unit FParamRecMercDesemb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Db,
  DBTables, Wwquery, wwdblook;

type
  TFrmParamRecMercDesemb = class(TfrmOkCancelar)
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    qryTipoDesemb: TwwQuery;
    lblTipoDesemb: TLabel;
    dblcTipoDesemb: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamRecMercDesemb: TFrmParamRecMercDesemb;

implementation

{$R *.DFM}
uses DRptRelats, uSistema, uMensErro, uString;

procedure TFrmParamRecMercDesemb.FazRel;
begin
   DtmRptRelats.lbPer18.Caption   := ' De ' + edDataI.Text + ' a ' + edDataF.Text + ' ';
   With DtmRptRelats.qryRecMercDesemb Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT                                         ');
         Sql.Add('    IT.CODTIPRECDES,                           ');
         Sql.Add('    TD.DESCRICAO,                              ');
         Sql.Add('    SUM(NF.VLRNOTAFISCAL)                      ');
         Sql.Add('FROM                                           ');
         Sql.Add('    ITENSRECEBDEVOL IT,                        ');
         Sql.Add('    NFRECEBDEVOL NF,                           ');
         Sql.Add('    TIPORECEBDESEMB TD                         ');
         Sql.Add('WHERE                                                     ');
         sql.Add('      (NF.DATAENTDEVOL >= TO_DATE('''+EdDataI.Text+''',''dd/mm/yyyy'')) ');
         sql.Add('  AND (NF.DATAENTDEVOL <= TO_DATE('''+EdDataF.Text+''',''dd/mm/yyyy'')) ');

         If Trim(dblcTipoDesemb.Text) <> '' Then
           Sql.Add('  AND (IT.CODTIPRECDES = '+QuotedStr(Espaco(dblcTipoDesemb.LookupValue,15))+')');

         Sql.Add('  AND (IT.RECPAG = ''P'')                      ');
         Sql.Add('  AND (IT.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +') ');
         Sql.Add('  AND (IT.CODTIPRECDES = TD.CODTIPRECDES)      ');
         Sql.Add('  AND (IT.RECPAG = TD.RECPAG)                  ');

         Sql.Add('  AND (TD.ATIVO = ''S'') ');
         Sql.Add('  AND (IT.IDPESSOA = TD.IDPESSOA)              ');
         Sql.Add('  AND (IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL)  ');
         Sql.Add('GROUP BY                                       ');
         Sql.Add('    IT.CODTIPRECDES,                           ');
         Sql.Add('    TD.DESCRICAO                               ');
         Sql.Add('ORDER BY TD.DESCRICAO                          ');
      End;
end;

procedure TFrmParamRecMercDesemb.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipoDesemb.Close;
  qryTipoDesemb.ParamByName('IEMPRESA').Value := Sistema.IdEmpresa;
  qryTipoDesemb.Open;
  //
  edDataI.Date := Date;
  edDataF.Date := Date;
end;

procedure TFrmParamRecMercDesemb.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazRel;
end;

end.
