unit FCadHistXTipoAlter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, CMProcura, CmEventosCadastro, ImgList, uCMTypes;

type
  TFrmCadHistXTipoAlter = class(TfrmCadastroCS)
    CmpSaf: TCMProcura;
    CmpALterador: TCMProcura;
    Label1: TLabel;
    Label2: TLabel;
    qryIDHISTORICOSAF: TFloatField;
    qryCODALTERADOR: TFloatField;
    MsSaf: TMontaSelect;
    MsAlterador: TMontaSelect;
    QryValidaHist: TwwQuery;
    QryValidaAlt: TwwQuery;
    QryValidaHistRECPAG: TStringField;
    QryValidaAltRECPAG: TStringField;
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadHistXTipoAlter: TFrmCadHistXTipoAlter;

implementation

{$R *.DFM}

Procedure TFrmCadHistXTipoAlter.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
   Begin
      If Qry.Active Then Qry.Close;
      If Not Qry.Prepared Then Qry.Prepare;
      Qry.ParamByName('IDHISTORICOSAF').Asfloat := StrToInt(MontaSelect.ValoresChave[0]);
      Qry.ParamByName('CODALTERADOR').Asfloat := StrToInt(MontaSelect.ValoresChave[1]);
      Qry.Open;
   End;
End;

Procedure TFrmCadHistXTipoAlter.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  With QryValidaHist Do
   Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      Params[0].AsFloat := qryIDHISTORICOSAF.AsFloat;
      Open;
   End;

  With QryValidaAlt Do
   Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      Params[0].AsFloat := qryCODALTERADOR.AsFloat;
      Open;
   End;

   Accept := ((Not QryValidaHist.IsEmpty) And
             (Not QryValidaAlt.IsEmpty) And
             (QryValidaHistRecPag.AsString = QryValidaAltRecPag.AsString));

   QryValidaAlt.Close;
   QryValidaHist.Close;

   If Not Accept Then
      Application.MessageBox('Não é possivel relacionar Histórico e Alterador de Sistemas Diferentes','Integraçao SAF',Mb_IconInformation)
   Else
     Accept := (CmpSaf.Valida = VcOk) And (CmpALterador.Valida = VcOk);
End;

end.
