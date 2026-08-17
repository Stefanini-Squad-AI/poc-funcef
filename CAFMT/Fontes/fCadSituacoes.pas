unit fCadSituacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadSituacoes = class(TfrmCadastroCS)
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    sSituacao : string;
  public
    { Public declarations }
  end;

var
  frmCadSituacoes: TfrmCadSituacoes;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema;

procedure TfrmCadSituacoes.FormActivate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Text := 'SELECT IDSITUACAO,DESCSITUACAO FROM '+ Sistema.PrefixoServidor+'SITUACAO ORDER BY DESCSITUACAO ';
   try
      qry.Open;
   except
      MsgDlg('Problema na abertura da tabela SITUACAO','Erro',mtError,[mbOK],0);
      exit;
   end;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadSituacoes.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbedDescricao.Text) = '' then
   begin
     MsgDlg('Obrigatório preencher a Descrição da Situação','Erro',mtError,[mbOK],0);
     dbedDescricao.SetFocus;
     exit;
   end;
   if qry.FieldByName('IDSITUACAO').AsInteger <= 0 then
      qry.FieldByName('IDSITUACAO').AsInteger := LeUltRegistro(nil,'SITUACAO');
   inherited;
end;
//----------------------------------------------------------------------------------------
procedure TfrmCadSituacoes.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then
   begin
      sSituacao := MontaSelect.ValoresChave[0];
      qry.Locate('IDSITUACAO', strtoint(sSituacao),[]);
   end;
end;

procedure TfrmCadSituacoes.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusão de Situação Física de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteração de Situação Física de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remoção de Situação Física de Bens do Ativo Fixo') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.
