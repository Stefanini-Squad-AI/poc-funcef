unit FParamGrpRespon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery;

type
  TFrmParamGrpRespon = class(TfrmOkCancelar)
    qryGrpResp: TwwQuery;
    Label2: TLabel;
    dblcGrpResp: TCMDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;    
  public
    { Public declarations }
  end;

var
  FrmParamGrpRespon: TFrmParamGrpRespon;

implementation

{$R *.DFM}

Uses DRelRAD, uMensErro;

procedure TFrmParamGrpRespon.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrpResp.Open;
end;

Procedure TFrmParamGrpRespon.FazQry;
Begin
    DtmRelRad.LbGrpRespon.Caption := ' TODOS ';
    With DtmRelRad.qryGrpRespon Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                       ');
         Sql.Add('      GRP.IDGRPRESPON,                        ');
         Sql.Add('      GRP.NOME,                               '); 
         Sql.Add('      USU.NOMEUSUARIO                         '); 
         Sql.Add(' FROM                                         '); 
         Sql.Add('      RADRESPONXGRP GXU,                      '); 
         Sql.Add('      RADGRPRESPON GRP,                       '); 
         Sql.Add('      USUARIOSISTEMA USU                      '); 
         Sql.Add(' WHERE                                        ');
      If Trim(dblcGrpResp.Text) <> '' Then
         Begin
            DtmRelRad.LbGrpRespon.Caption := dblcGrpResp.Text;
            Sql.Add('      (GXU.IDGRPRESPON = '+dblcGrpResp.LookupValue+') ');
            Sql.Add('  AND (GXU.IDGRPRESPON = GRP.IDGRPRESPON)   ');
         End
      Else
         Sql.Add('        (GXU.IDGRPRESPON = GRP.IDGRPRESPON)   ');

         Sql.Add('    AND (GXU.IDUSUARIO   = USU.IDUSUARIO)     ');
         Sql.Add(' ORDER BY GRP.NOME, USU.NOMEUSUARIO           ');
         Open;
      End;
End;

procedure TFrmParamGrpRespon.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

end.
