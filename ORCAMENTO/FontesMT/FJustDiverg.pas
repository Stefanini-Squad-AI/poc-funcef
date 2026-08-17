unit FJustDiverg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  TREdit, Mask, uSistema, uCtrlTransacoesPorGrupo, uCtrlPadroes,
  uModulo, uMensErro, uDiasUteis, wwdblook;

type
  TFrmJustDiverg = class(TFrmCadastroMT)
    edtAno: TDBRealEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btProcurar: TBitBtn;
    MsContaOrc: TMontaSelect;
    cboMes: TwwDBLookupCombo;
    CdsPeriodo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure btProcurarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo: TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
  end;

var
  FrmJustDiverg: TFrmJustDiverg;

implementation

{$R *.DFM}

procedure TFrmJustDiverg.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  Cds.Data := CtrlTransacoesPorGrupo.ListaDivergencia(-1);

  with TDiasUteis.Create do
  try
     CdsPeriodo.Data := CtrlTransacoesPorGrupo.ListaPeriodo(Sistema.IdEmpresa,ExtraiAno(now));
  finally
     Free;
  end;

  MsContaOrc.Filtro.Add('C.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
end;




procedure TFrmJustDiverg.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlTransacoesPorGrupo);
end;




procedure TFrmJustDiverg.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := CtrlTransacoesPorGrupo.GravaDivergencia(Cds.Data,CmeCadastro.Operacao);
  if not Accept then
     MsgDlg('Não foi possível gravar os dados. ' + #13 +
            'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0);
end;




procedure TFrmJustDiverg.btProcurarClick(Sender: TObject);
begin
  inherited;
  MsContaOrc.Executar;
  if MsContaOrc.RetornouValor then
  begin
     Cds.FieldByName('IDCONTAORCAMEN').AsString := MsContaOrc.ValoresChave[0];
     Cds.FieldByName('IDPLANOORCAMEN').AsString := MsContaOrc.ValoresChave[1];
  end;
end;




procedure TFrmJustDiverg.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  with TDiasUteis.Create do
  try
     Cds.FieldByName('EXERCICIO').AsInteger := ExtraiAno(now);
  finally
     Free;
  end;
end;




procedure TFrmJustDiverg.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
     Cds.Data := CtrlTransacoesPorGrupo.ListaDivergencia(StrToInt(MontaSelect.ValoresChave[0]));
end;




procedure TFrmJustDiverg.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if Trim(Cds.FieldByname('IDCONTAORCAMEN').AsString) = '' then
  begin
     MsgDlg('Informe a conta orçamentária!','Aviso',mtWarning,[mbOk],0);
     Accept := false;
     Exit;
  end;

  if Trim(cboMes.Text) = '' then
  begin
     MsgDlg('Informe o período orçamentário!','Aviso',mtWarning,[mbOk],0);
     Accept := false;
     Exit;
  end;
  Accept := true;

end;

end.
