unit FParamGrpAut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo;

type
  TFrmParamGrpAut = class(TfrmOkCancelar)
    qryGrpAut: TwwQuery;
    qryGrpAutIDGRUPOAUTORIZA: TFloatField;
    Label2: TLabel;
    dblcGrpAut: TCMDBLookupCombo;
    qryGrpAutNOMEGRUPOAUT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;  
  public
    { Public declarations }
  end;

var
  FrmParamGrpAut: TFrmParamGrpAut;

implementation

{$R *.DFM}

Uses DRelRAD, uMensErro;

Procedure TFrmParamGrpAut.FazQry;
Begin
    DtmRelRad.LbGrpAut.Caption := ' TODOS ';
    With DtmRelRad.qryGrpAut Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                               ');
         Sql.Add('       AUT.IDGRUPOAUTORIZA,                           ');
         Sql.Add('       AUT.NUMAUTORIZACAO,                            ');
         Sql.Add('       GA.NOMEGRUPOAUT,                               ');
         Sql.Add('       AUT.VALORAUTORIZA,                             ');
         Sql.Add('       CC.NOME,                                       ');
         Sql.Add('       GP.DESCGRUPOPROD,                              ');
         Sql.Add('       CR.NOME AS DESCCENTRESP,                       ');
         Sql.Add('       UN.NOME AS DESCUNIDNEG,                        ');
         Sql.Add('       GRP.NOME AS DESCGRPRESPON                      ');
         Sql.Add(' FROM                                                 ');
         Sql.Add('     RADGRAUTXGRRESPON AUT,                           ');
         Sql.Add('     RADGRUPOAUTORIZA GA,                             ');
         Sql.Add('     CENTCUST CC,                                     ');
         Sql.Add('     GRUPPROD GP,                                     ');
         Sql.Add('     CENTRESPON CR,                                   ');
         Sql.Add('     UNIDNEGOCIO UN,                                  ');
         Sql.Add('     RADGRPRESPON GRP                                 ');
         Sql.Add(' WHERE                                                ');
      If Trim(dblcGrpAut.Text) <> '' Then
         Begin
            DtmRelRad.LbGrpAut.Caption := dblcGrpAut.Text;
            Sql.Add('     ( AUT.IDGRUPOAUTORIZA = '+dblcGrpAut.LookupValue+')  ');
            Sql.Add(' AND ( AUT.IDGRUPOAUTORIZA = GA.IDGRUPOAUTORIZA)  ');
         End
      Else
         Sql.Add('    ( AUT.IDGRUPOAUTORIZA = GA.IDGRUPOAUTORIZA)  ');

         Sql.Add('     AND ( AUT.IDEMPRESA = CC.IDEMPRESA(+))           ');
         Sql.Add('     AND ( AUT.IDPESSOA = CR.IDPESSOA(+))             ');
         Sql.Add('     AND ( AUT.IDPESSOA = UN.IDPESSOA(+))             ');
         Sql.Add('     AND ( AUT.IDGRPRESPON = GRP.IDGRPRESPON)         ');
         Sql.Add('     AND ( AUT.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ');
         Sql.Add('     AND ( AUT.CODGRUPOPROD = GP.CODGRUPOPROD(+))     ');
         Sql.Add('     AND ( AUT.CODCENTRORESPON = CR.CODCENTRORESPON(+))');
         Sql.Add('     AND ( AUT.UNIDNEGOC = UN.UNIDNEGOC(+))            ');
         Open;
      End;
End;


procedure TFrmParamGrpAut.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrpAut.Open;
end;

procedure TFrmParamGrpAut.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

end.
