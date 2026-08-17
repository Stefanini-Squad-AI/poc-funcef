unit FParamFluxoProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery;

type
  TFrmParamFluxoProc = class(TfrmOkCancelar)
    qryProc: TwwQuery;
    Label1: TLabel;
    dblcProc: TCMDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamFluxoProc: TFrmParamFluxoProc;

implementation

{$R *.DFM}
Uses DRelRAD, uMensErro;

procedure TFrmParamFluxoProc.FormCreate(Sender: TObject);
begin
  inherited;
  qryProc.Open;
end;

Procedure TFrmParamFluxoProc.FazQry;
Begin
    DtmRelRad.LbProc2.Caption := ' TODOS ';
    With DtmRelRad.qryFluxoProc Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                         ');
         Sql.Add('       TP.IDTIPOPROCESSO,                       ');
         Sql.Add('       TP.NOME AS NOMEPROC,                     ');
         Sql.Add('       GG.NOME AS GRPGESTOR,                    ');
         Sql.Add('       GC.NOME AS GRPCON,                       ');
         Sql.Add('       TP.DESCRICAO,                            ');
         Sql.Add('       TP.NUMDIASPREVISTO,                      ');
         Sql.Add('       TE.NOME AS NOMEETAPA,                    ');
         Sql.Add('       EF.IDTIPOETAPA,                          ');
         Sql.Add('       EA.NOME AS ETAPAPRED,                    ');
         Sql.Add('       AN.NOME AS ANDAMENTO                     ');
         Sql.Add(' FROM                                           ');
         Sql.Add('       RADTIPOPROCESSO TP,                      ');
         Sql.Add('       RADFLUXO FL,                             ');
         Sql.Add('       RADTIPOETAPAXPROC EXP,                   ');
         Sql.Add('       RADGRPRESPON GG,                         ');
         Sql.Add('       RADGRPRESPON GC,                         ');
         Sql.Add('       RADTIPOETAPA EF,                         ');
         Sql.Add('       RADTIPOETAPA TE,                         ');
         Sql.Add('       RADTIPOETAPA EA,                         ');
         Sql.Add('       RADANDAMENTO AN                          ');
         Sql.Add(' WHERE                                          ');
      If Trim(dblcProc.Text) <> '' Then
         Begin
            DtmRelRad.LbProc2.Caption := dblcProc.Text;
            Sql.Add('       (TP.IDTIPOPROCESSO = '+dblcProc.LookupValue+')');
            Sql.Add('   AND (TP.IDGRPGESTOR     = GG.IDGRPRESPON(+)) ');
         End
      Else
         Sql.Add('       (TP.IDGRPGESTOR     = GG.IDGRPRESPON(+)) ');

         Sql.Add('   AND (TP.IDGRPCONSULTA   = GC.IDGRPRESPON(+)) ');
         Sql.Add('   AND (TP.IDTIPOPROCESSO  = FL.IDTIPOPROCESSO) ');
         Sql.Add('   AND (EXP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO) ');
         Sql.Add('   AND (EXP.IDTIPOETAPA    = TE.IDTIPOETAPA)    ');
         Sql.Add('   AND (EXP.IDTIPOETAPA    = EF.IDTIPOETAPA)    ');
         Sql.Add('   AND (FL.IDTIPOETAPA     = EF.IDTIPOETAPA)    ');
         Sql.Add('   AND (FL.IDETAPAANT      = EA.IDTIPOETAPA)    ');
         Sql.Add('   AND (FL.IDANDAMENTO     = AN.IDANDAMENTO)    ');
         Sql.Add(' ORDER BY TP.NOME, EXP.FLGINICIAL DESC          ');
         Open;
      End;
End;
procedure TFrmParamFluxoProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

end.
