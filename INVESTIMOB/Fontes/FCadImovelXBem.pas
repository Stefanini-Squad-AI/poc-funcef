{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadImovelXBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, CmEventosCadastro, Db, Wwdatsrc, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  Grids, Wwdbigrd, Wwdbgrid, TB97, ComCtrls, ExtCtrls, wwdbedit, Wwdotdot,
  Wwdbcomb, Mask, DBCtrls, TREdit, mImovel;

type
  TfrmCadImovelXBem = class(TfrmCadastroDetalhe)
    qryIDBEM: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIXBGRUPO: TStringField;
    qryIXBPERCENT: TFloatField;
    qryBuscaBem: TwwQuery;
    qryBuscaBemIDBEM: TFloatField;
    qryBuscaBemIDPESSOA: TFloatField;
    qryBuscaBemPLACA: TFloatField;
    qryBuscaBemDESBEM: TStringField;
    qryPreencheBem: TwwQuery;
    qryPreencheBemIDBEM: TFloatField;
    qryPreencheBemIDPESSOA: TFloatField;
    qryPreencheBemPLACA: TFloatField;
    qryPreencheBemDESBEM: TStringField;
    DBedtPlaca: TDBRealEdit;
    Label3: TLabel;
    btnBuscaBem: TBitBtn;
    DBedtDescricaoBem: TDBEdit;
    Label48: TLabel;
    DBcboGrupo: TwwDBComboBox;
    Label1: TLabel;
    Bevel1: TBevel;
    qryPlaca: TFloatField;
    qryDesc: TStringField;
    qryGrupo: TStringField;
    molImovel1: TmolImovel;

    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure DBedtPlacaExit(Sender: TObject);
    procedure btnBuscaBemClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);

  private { Private declarations }
     function VerificaPreenchimento: boolean;

  public { Public declarations }

  end;



var
  frmCadImovelXBem: TfrmCadImovelXBem;



implementation
{$R *.DFM}
uses
   uComunsImobiliario, uVerificaPreenchimento, uFuncoesImob, uSistema, uMensErro, dMS, uCAF;



function TfrmCadImovelxBem.VerificaPreenchimento: boolean;
begin
   Result := False;

   try

      if molImovel1.iImovel <= 0 then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação!', molImovel1.btnBuscaImovel);

      if ( (length(trim(DBedtDescricaoBem.Text)) <= 0) or (length(trim(DBedtPlaca.Text)) <= 0) ) then
         raise EValidacao.CreateVal('É necessário indicar o Bem!', DBedtPlaca);

   except

      on ev : EValidacao do begin
   	 if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCadImovelXBem.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadImovelXBem.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qryIDIMOVEL.asInteger   := molImovel1.iImovel;
   qryIDPESSOA.AsInteger   := Sistema.idEmpresa;
end;



procedure TfrmCadImovelXBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   qry.Close;
   qryBuscaBem.Close;
   qryPreencheBem.Close;
end;



procedure TfrmCadImovelXBem.qryCalcFields(DataSet: TDataSet);
begin
   inherited;

   if not(qry.FieldByName('IDBEM').isNULL) then begin

      LimpaParametros(qryPreencheBem);
      qryPreencheBem.ParamByName('PIDBEM').AsInteger := qryIDBEM.AsInteger;
      qryPreencheBem.Open;

      qryPlaca.asFloat  := qryPreencheBem.FieldByName('PLACA').asFloat;
      qry.FieldByName('Desc').asString  := qryPreencheBem.FieldByName('DESBEM').asString;

   end;

   qry.FieldByName('Grupo').asString := CAF.GrupoExtenso(qry.FieldByName('IXBGRUPO').asString);
end;



procedure TfrmCadImovelXBem.DBedtPlacaExit(Sender: TObject);
begin
   inherited;

   if DBedtPlaca.Modified then begin

      with qryBuscaBem do begin
         LimpaParametros(qryBuscaBem);
         ParamByName('PPLACA').asFloat := DBedtPlaca.Value;
         Open;

         if not(isEmpty) then begin
            if qry.State in [dsInsert, dsEdit] then qryIDBEM.asInteger := qryBuscaBemIDBEM.asInteger;
         end;

         Close;
      end;
   end;
end;



procedure TfrmCadImovelXBem.btnBuscaBemClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Bem.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Bem.RetornouValor then begin
      if qry.State in [dsInsert, dsEdit] then qryIDBEM.asInteger := StrToInt(dtmMS.MS_Bem.ValoresChave[0]);
   end;
end;



procedure TfrmCadImovelXBem.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   LimpaParametros(qry);
   qry.ParamByName('PEMPRESAPROP').asInteger := Sistema.idEmpresa;
   qry.ParamByName('PIDIMOVEL').asInteger    := molImovel1.iImovel;
   qry.Open;
end;



procedure TfrmCadImovelXBem.molImovel1btnBuscaImovelClick(Sender: TObject);
begin
   inherited;
   molImovel1.btnBuscaImovelClick(Sender);

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Imovel.RetornouValor then begin
      Screen.Cursor := crHourGlass;
      CmeCadastroFind(self);
      Screen.Cursor := crDefault;
   end;
end;



end.
