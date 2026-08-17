unit fCadTipoArea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadTipoArea = class(TfrmCadastroCS)
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sTipoArea : String;
  end;

var
  frmCadTipoArea: TfrmCadTipoArea;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema;

procedure TfrmCadTipoArea.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Text := 'SELECT * FROM ' + Sistema.PrefixoServidor + 'TIPOAREA ORDER BY DESCTIPOAREA';
   try
      qry.Open;
   except
      MsgDlg('Problema na abertura da tabela TIPOAREA','Erro',mtError,[mbOk],0);
      exit;
   end;
end;

procedure TfrmCadTipoArea.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbedDescricao.Text) = '' then
   begin
      MsgDlg('Obrigatório preencher a Descrição da Área','Erro',mtError,[mbOk],0);
      dbedDescricao.SetFocus;
      exit;
   end;
   if qry.FieldByName('IDTIPOAREA').AsInteger <= 0 then
      qry.FieldByName('IDTIPOAREA').AsInteger := LeUltRegistro(nil,'TIPOAREA');
   inherited;
end;

procedure TfrmCadTipoArea.CmeCadastroFind(Sender: TObject);
begin
   if (MontaSelect.RetornouValor) then
   begin
      sTipoArea := MontaSelect.ValoresChave[0];
      qry.Locate('IDTIPOAREA', strtoint(sTipoArea),[]);
   end;
end;

procedure TfrmCadTipoArea.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusão de Tipo de Área de Localização de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteração de Tipo de Área de Localização de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remoção de Tipo de Área de Localização de Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.
