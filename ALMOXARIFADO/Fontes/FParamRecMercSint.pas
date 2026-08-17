unit FParamRecMercSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBTables, Wwquery;

type
  TFrmParamRecMercSint = class(TfrmOkCancelar)
    gbDatas: TGroupBox;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    RgOrdem: TRadioGroup;
    qryAlmox: TwwQuery;
    Label4: TLabel;
    dblkcmbAlmox: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamRecMercSint: TFrmParamRecMercSint;

implementation

{$R *.DFM}
Uses DRptRelats, uMensErro, uSistema;

procedure TFrmParamRecMercSint.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Date;
  edDataFim.Date := Date;
  //
  qryAlmox.close;
  qryAlmox.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa; 
  qryAlmox.Open;
end;
Procedure TFrmParamRecMercSint.FazQry;
Begin
   With DtmRptRelats.qryRecMercSint Do
     Begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT ');
        Sql.Add('      NF.DATAENTDEVOL, ');
        Sql.Add('      NF.DATAEMISNF,   ');
        Sql.Add('      P.RAZAOSOCIAL,   ');
        Sql.Add('      (TO_CHAR(NF.NUMNF) || ''/'' || NF.COMPLNF) AS NOTANUM, ');
        Sql.Add('      NF.VLRNOTAFISCAL, ');
        Sql.Add('      NF.FLGTIPONOTA,   ');
        Sql.Add('      TD.DESCRICAO AS TIPODOC ');
        Sql.Add(' FROM                   ');
        Sql.Add('      PESSOA P,         ');
        Sql.Add('      NFRECEBDEVOL NF,  ');
        Sql.Add('      DOCUMENTO D,      ');
        Sql.Add('      TIPODOCRECPAG TD  ');
        Sql.Add(' WHERE                  ');
        Sql.Add('      (NF.FLGTIPONOTA <> ''D'') ');
        If Trim(dblkcmbAlmox.text ) <> '' then
           Sql.add(' AND EXISTS (SELECT I.IDNFRECEBDEVOL FROM ITENSRECEBDEVOL I WHERE (I.CODALMOXARIFADO = '+dblkcmbAlmox.LookupValue+') AND (I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL) )');

        Sql.Add('  AND (NF.DATAENTDEVOL >= TO_DATE('''+DateToStr(EdDataINI.Date)+''',''dd/mm/yyyy'')) ');
        Sql.Add('  AND (NF.DATAENTDEVOL <= TO_DATE('''+DateToStr(EdDataFIM.Date)+''',''dd/mm/yyyy'')) ');
        Sql.Add('  AND (NF.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')');
        Sql.Add('  AND (NF.IDFORCLI = P.IDPESSOA) ');
        Sql.Add('  AND (NF.CODDOCUMENTO = D.CODDOCUMENTO(+)) ');
        Sql.Add('  AND (D.CODTIPDOC     = TD.CODTIPDOC(+))   ');
        Case RgOrdem.ItemIndex Of
           0 : Sql.Add('ORDER BY NF.DATAENTDEVOL,P.RAZAOSOCIAL, NF.NUMNF ');
           1 : Sql.Add('ORDER BY NF.DATAENTDEVOL,NF.NUMNF,P.RAZAOSOCIAL ');
        End;
        Open;
     End;
    DtmRptRelats.lbPer8.Caption := ' De '+EdDataINI.Text+ ' a '+EdDataFIM.Text +' ';
End;

procedure TFrmParamRecMercSint.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If EdDataFim.Date < EdDataIni.Date Then
     Begin
         MsgDlg('Data de Téminio não pode ser menor do que a data final','Erro',mtError,[mbOK],0);
         EdDataFim.SetFocus;
         ModalResult := MrNone;
     End
  Else
     Begin
         ModalResult := MrOk;
         FazQry;
     End;
end;

end.
