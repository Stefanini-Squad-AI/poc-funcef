unit FParamTipoEtapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo;

type
  TFrmParamTipoEtapa = class(TfrmOkCancelar)
    qryEtapa: TwwQuery;
    Label3: TLabel;
    dblcEtapa: TCMDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;    
  public
    { Public declarations }
  end;

var
  FrmParamTipoEtapa: TFrmParamTipoEtapa;

implementation

{$R *.DFM}

Uses DRelRAD, uMensErro;

procedure TFrmParamTipoEtapa.FormCreate(Sender: TObject);
begin
  inherited;
  qryEtapa.Open;
end;

Procedure TFrmParamTipoEtapa.FazQry;
Begin
    With DtmRelRad.qryTipoEtapa Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                      ');
         Sql.Add('      IDTIPOETAPA,                                           ');
         Sql.Add('      NOME,                                                  ');
         Sql.Add('      DECODE(FLGAUTOMATICA,''S'','' X '','''') AS AUTOMATICO,  ');
         Sql.Add('      DECODE(FLGAUTORIZACAO,''S'','' X '','''') AS AUTORIZA,   ');
         Sql.Add('      DESCRICAO                                              ');
         Sql.Add(' FROM                                                        ');
         Sql.Add('      RADTIPOETAPA                                           ');
      If Trim(dblcEtapa.Text) <> '' Then
         Sql.Add(' WHERE  ( IDTIPOETAPA = '+dblcEtapa.LookupValue+')');
         Sql.Add(' ORDER BY NOME                                               ');
         Open;
      End;
End;

procedure TFrmParamTipoEtapa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

end.
