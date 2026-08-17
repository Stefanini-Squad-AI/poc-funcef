unit fCadTipoDespAV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadTipoDespAV = class(TfrmCadastroCS)
    Label1: TLabel;
    dbedDescricao: TwwDBEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sTipoDesp : String;
  end;

var
  frmCadTipoDespAV: TfrmCadTipoDespAV;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema;

procedure TfrmCadTipoDespAV.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Text := 'SELECT * FROM '+ Sistema.PrefixoServidor+'TIPODESPESAAV ORDER BY DESTIPODESPESA';
   try
      qry.Open;
   except
      MsgDlg('Problema na abertura da tabela TIPODESPESAAV','Erro',mtError,[mbOk],0);
      exit;
   end;
end;

procedure TfrmCadTipoDespAV.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(dbedDescricao.Text) = '' then
   begin
      MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOK],0);
      dbedDescricao.SetFocus;
      exit;
   end;
   if qry.FieldByName('IDTIPODESPESA').AsInteger <= 0 then
      qry.FieldByName('IDTIPODESPESA').AsInteger := LeUltRegistro(nil,'TIPODESPESAAV');
   inherited;
end;

procedure TfrmCadTipoDespAV.CmeCadastroFind(Sender: TObject);
begin
   if (MontaSelect.RetornouValor) then
   begin
      sTipoDesp := MontaSelect.ValoresChave[0];
      qry.Locate('IDTIPODESPESA', strtoint(sTipoDesp),[]);
   end;
end;

procedure TfrmCadTipoDespAV.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inclusão de Tipo de Despesa para Acréscimo de Valor em Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteração de Tipo de Despesa para Acréscimo de Valor em Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remoção de Tipo de Despesa para Acréscimo de Valor em Bens') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.
