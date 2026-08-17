unit fCadTipoSaidaTemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadTipoSaidaTemp = class(TfrmCadastroCS)
    dbeDescTipSaiTmp: TwwDBEdit;
    Label1: TLabel;
    qryIDTIPOSAIDATEMP: TFloatField;
    qryDESCTIPSAITEMP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoSaidaTemp: TfrmCadTipoSaidaTemp;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema;

procedure TfrmCadTipoSaidaTemp.FormCreate(Sender: TObject);
begin
   inherited;
   if not qry.Prepared then qry.Prepare;
   qry.Open;
end;

procedure TfrmCadTipoSaidaTemp.CmeCadastroFind(Sender: TObject);
var
   iIdTipoSaidaTemp : Integer;
begin
   if (MontaSelect.RetornouValor) then
   begin
      iIdTipoSaidaTemp := strtoint(MontaSelect.ValoresChave[0]);
      qry.Locate('IDTIPOSAIDATEMP', iIdTipoSaidaTemp,[]);
   end;
end;

procedure TfrmCadTipoSaidaTemp.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbeDescTipSaiTmp.Text) = '' then
   begin
      MsgDlg('Obrigatório preencher a Descrição!','Erro',mtError,[mbOK],0);
      dbeDescTipSaiTmp.SetFocus;
      exit;
   end;
   if (qryIDTIPOSAIDATEMP.AsInteger <= 0) then
      qryIDTIPOSAIDATEMP.AsInteger := LeUltRegistro(nil,'TIPOSAIDATEMP');
   inherited;
end;

procedure TfrmCadTipoSaidaTemp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qry.UnPrepare;
end;

procedure TfrmCadTipoSaidaTemp.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusão de Motivo para Saída Temporária de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteração de Motivo para Saída Temporária de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remoção de Motivo para Saída Temporária de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.
