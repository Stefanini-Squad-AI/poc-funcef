unit FCadTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadTitulo = class(TfrmCadastroCS)
    dblEmissor: TwwDBLookupCombo;
    dblTipoRendaFixa: TwwDBLookupCombo;
    dbeDescricao: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qryEmissor: TwwQuery;
    qryTipRenFixa: TwwQuery;
    qryEmissorIDEMISSOR: TFloatField;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryTipRenFixaIDTITRENFIXA: TFloatField;
    qryTipRenFixaCODTIPRENFIXA: TStringField;
    qryIDTITULO: TFloatField;
    qryIDEMISSOR: TFloatField;
    qryCODTIPRENFIXA: TStringField;
    qryDESCTITULO: TStringField;
    qrySIGLAEMISSOR: TStringField;
    qryTipRenFixaDATAEMTITRENFIX: TDateTimeField;
    qryTipRenFixaDATAVENCTITRENFIX: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel(N : LongInt);
  public
    { Public declarations }
  end;

var
  frmCadTitulo: TfrmCadTitulo;

implementation

{$R *.DFM}
Uses DBaseDados, uMensErro, uDataBase;

Procedure TfrmCadTitulo.Sel(N : LongInt);
begin
  qry.Close;
  qry.ParamByName('P_IDTITULO').AsInteger := N;
  qry.Open;
end;

Procedure TfrmCadTitulo.CmeCadastroInsert(Sender: TObject);
begin
  Inherited;
  SelectFirst;
end;

Procedure TfrmCadTitulo.CmeCadastroFind(Sender: TObject);
begin
  If MontaSelect.RetornouValor Then
     Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTitulo.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := False;
  If dblEmissor.LookupValue = '' then
    Begin
       MsgDlg('Emissor não preenchido','Erro',mtError,[mbOK],0);
       dblEmissor.SetFocus;
    end Else
  If dblTipoRendaFixa.LookupValue = '' then
    Begin
       MsgDlg('Tipo de Renda Fixa não preenchido','Erro',mtError,[mbOK],0);
       dblTipoRendaFixa.SetFocus;
    end Else
       Accept := True;
end;

Procedure TfrmCadTitulo.CmeCadastroConfirma(Sender: TObject);
begin
 If qry.State = dsInsert Then
    qryIDTITULO.AsInteger := LeUltRegistro(nil,'TITULO');
 Inherited;
end;

procedure TfrmCadTitulo.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1);
end;

procedure TfrmCadTitulo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      
     SelectNext(ActiveControl,True,True)
end;

end.
