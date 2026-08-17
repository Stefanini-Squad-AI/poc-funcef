unit FParamInfoProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery;

type
  TFrmParamInfoProc = class(TfrmOkCancelar)
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
  FrmParamInfoProc: TFrmParamInfoProc;

implementation

{$R *.DFM}
Uses DRelRAD, uMensErro;

Procedure TFrmParamInfoProc.FazQry;
Begin
    DtmRelRad.LbProc3.Caption := ' TODOS ';
    With DtmRelRad.qryInfoProc Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                      ');
         Sql.Add('       TP.IDTIPOPROCESSO,                                    ');
         Sql.Add('       TP.NOME AS NOMEPROC,                                  ');
         Sql.Add('       GG.NOME AS GRPGESTOR,                                 ');
         Sql.Add('       GC.NOME AS GRPCON,                                    ');
         Sql.Add('       TP.DESCRICAO,                                         ');
         Sql.Add('       TP.NUMDIASPREVISTO,                                   ');
         Sql.Add('       TE.NOME AS NOMEETAPA,                                 ');
         Sql.Add('       EXP.IDTIPOETAPA,                                      ');
         Sql.Add('       EXP.NUMDIASPREVISTO AS NUMDIAPREVETAPA,               ');
         Sql.Add('       DECODE(EXP.FLGINICIAL,''S'','' X '','''') AS INICIAL,   ');
         Sql.Add('       DECODE(EXP.FLGFINAL,''S'','' X '','''') AS FINAL,       ');
         Sql.Add('       M.NOMEMODULO,                                         ');
         Sql.Add('       A.NOMEGRUPOAUT                                        ');
         Sql.Add(' FROM                                                        ');
         Sql.Add('       RADTIPOPROCESSO TP,                                   ');
         Sql.Add('       RADTIPOETAPAXPROC EXP,                                ');
         Sql.Add('       RADETAPAXGRPRESP EXA,                                 ');
         Sql.Add('       RADGRUPOAUTORIZA A,                                   ');
         Sql.Add('       RADGRPRESPON GG,                                      ');
         Sql.Add('       RADGRPRESPON GC,                                      ');
         Sql.Add('       RADTIPOETAPA TE,                                      ');
         Sql.Add('       MODULO M                                              ');
         Sql.Add(' WHERE                                                       ');
      If Trim(dblcProc.Text) <> '' Then
         Begin
            DtmRelRad.LbProc3.Caption := dblcProc.Text;
            Sql.Add('       (TP.IDTIPOPROCESSO = '+dblcProc.LookupValue+')');
            Sql.Add('   AND (TP.IDGRPGESTOR    = GG.IDGRPRESPON(+)) ');
         End
      Else
         Sql.Add('       (TP.IDGRPGESTOR      = GG.IDGRPRESPON(+))             ');

         Sql.Add('   AND (TP.IDGRPCONSULTA    = GC.IDGRPRESPON(+))             ');
         Sql.Add('   AND (EXP.IDTIPOPROCESSO  = TP.IDTIPOPROCESSO)             ');
         Sql.Add('   AND (EXP.IDTIPOETAPA     = TE.IDTIPOETAPA)                ');
         Sql.Add('   AND (EXP.IDMODULO        = M.IDMODULO)                    ');
         Sql.Add('   AND (EXA.IDTIPOPROCESSO  = TP.IDTIPOPROCESSO)             ');
         Sql.Add('   AND (EXA.IDTIPOETAPA     = TE.IDTIPOETAPA)                ');
         Sql.Add('   AND (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)             ');
         Sql.Add(' ORDER BY TP.NOME, EXP.FLGINICIAL DESC                       ');
         Sql.SaveToFile('C:\CHABU.SQL');
         Open;
      End;
End;

procedure TFrmParamInfoProc.FormCreate(Sender: TObject);
begin
  inherited;
  qryProc.Open;
end;

procedure TFrmParamInfoProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

end.
