{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. WO ..........: WO10578
Data............: 09/05/2024
Responsável.....: Helen V Bianchi
Descrição.......: Adicionado a coluna Status
--------------------------------------------------------------------------------
N. Sol..........: 50900
Data............: 23/07/2019
Responsável.....: Everson Cunha
Descrição.......: Retirar as colunas "Aviso(dias), Em Renovação, Responsável,
                  Data de Inclusão e Descrição do Andamento".
                  Ordenação das colunas.
--------------------------------------------------------------------------------
N. Sol..........: 174920
N. Kintana......: 1591690
Data............: 25/10/2012
Responsável.....: Thiago Melo
Descrição.......: Manter histórico de renovação de contratos
--------------------------------------------------------------------------------
N. Sol..........: 168270
N. Kintana......: 1481496
Data............: 15/02/2012
Responsável.....: Edilaine Ferraresi
Alteração Form..: incluir flag para informar que o contrato está em processo de
                  renovação e o nome do responsável no grid
--------------------------------------------------------------------------------
Rotina..........: bbtnIniciarRenovacaoClick
N. Sol..........: 174919
N. Kintana......: 1591697
Data............: 02/03/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: Chamar a tela Cadastro de Contratos a partir do botão
-------------------------------------------------------------------------------}

unit FAvisoVencContrMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, Db,
  Wwdatsrc, DBClient, uCMClientDataSet, uCtrlAvisoVencContr,
  FCadContratoMT, FTelaAut; // Edilaine - SOL 174919 / KTN 1591697

type
  TfrmAvisoVencMT = class(TfrmSairAjuda)
    bbtnIniciarRenovacao: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnProcessoRenovacao: TmaHelpBitBtn;
    ToolbarSep972: TToolbarSep97;
    spContratos: TCMSqlParams;
    dsContrato: TwwDataSource;
    cdsContrato: TCMClientDataSet;
    dbgContrato: TwwDBGrid;
    procedure dbgContratoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnIniciarRenovacaoClick(Sender: TObject);
    procedure bbtnProcessoRenovacaoClick(Sender: TObject);
    procedure cdsContratoAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dsContratoStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    // Thiago Melo SOL 174920 KINTANA 1591690 ini
    procedure dbgContratoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbgContratoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    // Thiago Melo SOL 174920 KINTANA 1591690 fim 
  private
    { Private declarations }
    CtrlAvisoVencContr : TCtrlAvisoVencContr;
  public
    { Public declarations }
  end;

var
  frmAvisoVencMT: TfrmAvisoVencMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, FMTAcompProc;

procedure TfrmAvisoVencMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlAvisoVencContr:=TCtrlAvisoVencContr.Create;
   CtrlAvisoVencContr.Initialize(dtmBaseDados.dbBaseDados,True);
   cdsContrato.Data:=CtrlAvisoVencContr.ListContratosVenc(Sistema.IdEmpresa,Sistema.IdUsuario);

   // Edilaine - SOL 174919 / KTN 1591697
   bbtnIniciarRenovacao.Enabled:= (not cdsContrato.IsEmpty);
end;

procedure TfrmAvisoVencMT.bbtnIniciarRenovacaoClick(Sender: TObject);
var
  idContrato : double;
  frmAux : TfrmCadContratoMT;  // Edilaine - SOL 174919 / KTN 1591697
begin
   // Edilaine - SOL 174919 / KTN 1591697
   idContrato := CdsContrato.FieldByName('IDCONTRATO').AsFloat;
   frmAux := TfrmCadContratoMT.Create(Self);
   try
      frmAux.CarregaContrato( idContrato );
      AbrirForm(frmAux, TfrmCadContratoMT, true);
   finally
      frmAux.Free;
   end;
   // Edilaine - SOL 174919 / KTN 1591697 - fim


   // Edilaine - SOL 174919 / KTN 1591697 - comentado
   {
   cdsContrato.Edit;
   cdsContrato.FieldByName('MARCADO').AsString:='S';
   if not(CtrlAvisoVencContr.IniciaRenovacao(cdsContrato.Data,
                                             Sistema.IdEmpresa,
                                             Sistema.IdUsuario)) then
          MsgDlg('Não foi possível iniciar o processo de Renovação de Contrato.'+#10#13+
                 CtrlAvisoVencContr.MessageInfo,
                 'Erro',mtError,[mbOK],0)
   else
    begin
       cdsContrato.Close;
       cdsContrato.Data:=CtrlAvisoVencContr.ListContratosVenc(Sistema.IdEmpresa,Sistema.IdUsuario);
    end;
    }
    // Edilaine - SOL 174919 / KTN 1591697 - fim
end;

procedure TfrmAvisoVencMT.bbtnProcessoRenovacaoClick(Sender: TObject);
begin
   with TFrmMTAcompProc.Create(Self) do
   try
      sTipoProc:='Renovação de Contrato';
      sPessoa:=Sistema.NomeEmpresa;
      sUsuario:=Sistema.NomeUsuario;
      sObs:=cdsContrato.FieldByName('OBS').AsString;
      iNumProc:=Trunc(cdsContrato.FieldByName('IDPROCESSO').AsFloat);
      ShowModal;
   finally
      Free;
   end;
end;

procedure TfrmAvisoVencMT.dbgContratoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   //Faz com que as linhas do grid tenham cores alternadas
   if (State<>[gdSelected]) then
    begin
      if not(Highlight) then
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            ABrush.color:=clwhite
         else
            ABrush.Color:=clInfoBk;
    end
   else
    begin
       ABrush.Color:=clHighLight;
       AFont.Color:=clHighLightText;
    end;
end;

procedure TfrmAvisoVencMT.cdsContratoAfterScroll(DataSet: TDataSet);
begin
   inherited;
   // Edilaine - SOL 174919 / KTN 1591697 - comentado
   {
   bbtnIniciarRenovacao.Enabled:=(cdsContrato.FieldByName('IDPROCESSO').AsFloat=0) AND
                                 (cdsContrato.FieldByName('IDTIPOPROCESSORAD').AsFloat<>0) AND
                                 (Sistema.UsaRAD);
   }
   // Edilaine - SOL 174919 / KTN 1591697 - fim

   bbtnProcessoRenovacao.Enabled:=(cdsContrato.FieldByName('IDPROCESSO').AsFloat<>0) AND
                                  (cdsContrato.FieldByName('FLGOK').AsString<>'S') AND
                                  (Sistema.UsaRAD);
end;

procedure TfrmAvisoVencMT.dsContratoStateChange(Sender: TObject);
begin
   inherited;
   if (cdsContrato.State in [dsInsert]) then cdsContrato.Cancel;
end;

procedure TfrmAvisoVencMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsContrato.Data:=CtrlAvisoVencContr.ListContratosVenc(Sistema.IdEmpresa,Sistema.IdUsuario);

end;

procedure TfrmAvisoVencMT.dbgContratoDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
var
  R : TRect;
begin
  // Thiago Melo SOL 174920 KINTANA 1591690 
  R := Rect;
  Dec(R.Bottom,2);
  
  if Field = cdsContrato.FieldByName('DESCANDAMENTO') then begin
    if not (gdSelected in State) then begin
      dbgContrato.Canvas.FillRect(Rect);
    end;
    dbgContrato.Canvas.TextRect(R,R.Left,R.Top, cdsContrato.FieldByName('DESCANDAMENTO').AsString);
  end;
end;

//Everson Cunha - SIG50900 - Início
procedure TfrmAvisoVencMT.dbgContratoTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  indice: string;
  existe: boolean;
begin
  if cdsContrato.IndexFieldNames = AFieldName then
  begin
    indice := AnsiUpperCase(AFieldName);

    try
      cdsContrato.IndexDefs.Find(indice);
      existe := true;
    except
      existe := false;
    end;

    if not existe then
    with cdsContrato.IndexDefs.AddIndexDef do
    begin
      Name := indice;
      Fields := AFieldName;
      Options := [ixDescending];
    end;

    cdsContrato.IndexName := indice;
  end
  else
    cdsContrato.IndexFieldNames := AFieldName;

    cdsContrato.First;
end;
//Everson Cunha - SIG50900 - Fim

end.

