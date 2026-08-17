unit fMTConsParamContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, IvEMulti, 
  TB97Tlbr, TB97, ExtCtrls, fcLabel, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, MontaSelect, Gauges,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF, uCtrlCafxContab;

type
  TfrmMTConsParamContab = class(TfrmSairAjuda)
    pnlDados: TPanel;
    pnlValores: TPanel;
    dbgHistorico: TwwDBGrid;
    dsDivergencias: TwwDataSource;
    eDataMov: TCMDateTimePicker;
    bbtnExecuta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    rdgGrupo: TRadioGroup;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    Label1: TLabel;
    rdgMovim: TRadioGroup;
    bbtnCancelar: TBitBtn;
    cdsBem: TCMClientDataSet;
    sqlBem: TCMSqlParams;
    cdsParamCAFxContab: TCMClientDataSet;
    sqlParamCAFxContab: TCMSqlParams;
    cdsDivergencias: TCMClientDataSet;
    sqlDivergencias: TCMSqlParams;
    cdsTipoMovimentacao: TCMClientDataSet;
    sqlTipoMovimentacao: TCMSqlParams;
    procedure bbtnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    ParamCAF   : TCtrlParamCAF;
    CafxContab : TCtrlCafxContab;
  public
    { Public declarations }
    bCancela : Boolean;
  end;

var
  frmMTConsParamContab: TfrmMTConsParamContab;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmMTConsParamContab.FormCreate(Sender: TObject);
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   CafxContab := TCtrlCafxContab.Create;
   CafxContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   cdsDivergencias.Close;
   sqlDivergencias.Open;
   //-------------------------------------------------------------------------------------
   eDataMov.Date := Date;
end;
//========================================================================================
procedure TfrmMTConsParamContab.FormActivate(Sender: TObject);
begin
   inherited;
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
end;
//========================================================================================
procedure TfrmMTConsParamContab.bbtnExecutaClick(Sender: TObject);
var
   iSubConta, iExercicio, iPeriodo : Integer;
   sObrigaCC, sNomeConta, sObrigaSubConta : String;

begin
   inherited;
   bCancela := False;
   pnlStatus.Visible := True;
   prgBar.Progress := 0;
   lblStatus.Caption := 'Preparando ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   cdsDivergencias.Close;
   sqlDivergencias.Open;
   //-------------------------------------------------------------------------------------
   cdsTipoMovimentacao.Close;
   if rdgGrupo.ItemIndex = 0 then
   begin
      if rdgMovim.ItemIndex = 0 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 01';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end else
      if rdgMovim.ItemIndex = 1 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND (IDTIPOMOVIMENTACAO = 06 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR ';
         sqlTipoMovimentacao.SQL.Strings[04] := '      IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 30 OR IDTIPOMOVIMENTACAO = 31)';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end else
      if rdgMovim.ItemIndex = 2 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND (IDTIPOMOVIMENTACAO = 14 OR IDTIPOMOVIMENTACAO = 15 OR IDTIPOMOVIMENTACAO = 21) ';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end else
      if rdgMovim.ItemIndex = 3 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 08';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end else
      if rdgMovim.ItemIndex = 4 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 09';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end else
      if rdgMovim.ItemIndex = 5 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' ';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end;
   end else
   begin
      if rdgMovim.ItemIndex = 0 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 01';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end else
      if rdgMovim.ItemIndex = 1 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND (IDTIPOMOVIMENTACAO = 06 OR IDTIPOMOVIMENTACAO = 25 OR IDTIPOMOVIMENTACAO = 24 OR IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 20 OR ';
         sqlTipoMovimentacao.SQL.Strings[04] := '      IDTIPOMOVIMENTACAO = 28 OR IDTIPOMOVIMENTACAO = 27 OR IDTIPOMOVIMENTACAO = 26 OR IDTIPOMOVIMENTACAO = 37 OR IDTIPOMOVIMENTACAO = 38 OR ';
         sqlTipoMovimentacao.SQL.Strings[05] := '      IDTIPOMOVIMENTACAO = 39 OR IDTIPOMOVIMENTACAO = 40 OR IDTIPOMOVIMENTACAO = 30 OR IDTIPOMOVIMENTACAO = 31)';
      end else
      if rdgMovim.ItemIndex = 2 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND (IDTIPOMOVIMENTACAO = 14 OR IDTIPOMOVIMENTACAO = 18 OR IDTIPOMOVIMENTACAO = 35 OR ';
         sqlTipoMovimentacao.SQL.Strings[04] := '      IDTIPOMOVIMENTACAO = 15 OR IDTIPOMOVIMENTACAO = 22 OR IDTIPOMOVIMENTACAO = 34 OR ';
         sqlTipoMovimentacao.SQL.Strings[05] := '      IDTIPOMOVIMENTACAO = 21 OR IDTIPOMOVIMENTACAO = 19 OR IDTIPOMOVIMENTACAO = 36)';
      end else
      if rdgMovim.ItemIndex = 3 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 08';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end else
      if rdgMovim.ItemIndex = 4 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' AND IDTIPOMOVIMENTACAO = 09';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end else
      if rdgMovim.ItemIndex = 5 then
      begin
         sqlTipoMovimentacao.SQL.Strings[03] := ' ';
         sqlTipoMovimentacao.SQL.Strings[04] := ' ';
         sqlTipoMovimentacao.SQL.Strings[05] := ' ';
      end;
   end;
   //-------------------------------------------------------------------------------------
   if not CafxContab.VerificaPeriodoContabil(Sistema.IdEmpresa, eDataMov.Date,
                                             iExercicio, iPeriodo) then
      Raise Exception.Create(CafxContab.MessageInfo);
   //-------------------------------------------------------------------------------------
   sqlTipoMovimentacao.Open;
   //-------------------------------------------------------------------------------------
   cdsBem.Close;
   sqlBem.Prepare;
   sqlBem.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
   sqlBem.ParamByName('DATAMOV').asDate := eDataMov.Date;
   sqlBem.ParamByName('FLGIMOVEL').AsInteger := rdgGrupo.ItemIndex;
   sqlBem.Open;
   //-------------------------------------------------------------------------------------
   prgBar.MaxValue := cdsBem.RecordCount;
   while not cdsBem.EOF do
   begin
      lblStatus.Caption := 'Verificando o Bem ' + cdsBem.FieldByName('PLACA').AsString;
      prgBar.Progress := prgBar.Progress + 1;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      cdsTipoMovimentacao.First;
      while not cdsTipoMovimentacao.EOF do
      begin
         cdsParamCAFxContab.Close;
         sqlParamCAFxContab.Prepare;
         sqlParamCAFxContab.ParamByName('IDGRUPO').AsFloat := cdsBem.FieldByName('IDGRUPO').AsFloat;
         sqlParamCAFxContab.ParamByName('IDTIPOMOVIMENTACAO').AsFloat := cdsTipoMovimentacao.FieldByName('IDTIPOMOVIMENTACAO').AsFloat;
         sqlParamCAFxContab.ParamByName('PLANO').AsInteger := ParamCAF.PLANOVIGENTE;
         sqlParamCAFxContab.ParamByName('IDPESSOA').AsFloat := cdsBem.FieldByName('IDPESSOA').AsFloat;
         sqlParamCAFxContab.Open;
         if cdsParamCAFxContab.IsEmpty then
         begin
            cdsDivergencias.Append;
            cdsDivergencias.FieldbyName('PLACA').AsFloat := cdsBem.FieldbyName('PLACA').AsFloat;
            cdsDivergencias.FieldbyName('DESBEM').AsString := cdsBem.FieldbyName('DESBEM').AsString;
            cdsDivergencias.FieldByName('GRUPOCONTABIL').AsString := 'O Grupo Contábil ' +
                                                                     trim(cdsBem.FieldByName('DESCGRUPO').AsString) +
                                                                     ' não possui contas contábeis na movimentação ' +
                                                                     cdsTipoMovimentacao.FieldByName('DESCTIPOMOVIMENTACAO').AsString;
            cdsDivergencias.Post;
         end else
         begin
            while not cdsParamCAFxContab.EOF do
            begin
               //-------------------------------------------------------------------------
               // Captura os Flags de verificação de Conta Contábil
               //-------------------------------------------------------------------------
               if CafxContab.ContaContab.TestaContaContabil(cdsParamCAFxContab.FieldByName('PLANO').AsInteger,
                                                            cdsParamCAFxContab.FieldByName('IDPESSOA').AsInteger,
                                                            iPeriodo, iExercicio,
                                                            cdsParamCAFxContab.FieldByName('PLACONTA').AsString,
                                                            False, False) then
               begin
                  sNomeConta := CafxContab.ContaContab.NomeConta;
                  sObrigaCc := CafxContab.ContaContab.ObrigaCentroCusto;
                  sObrigaSubConta := CafxContab.ContaContab.ObrigaSubConta;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil possui Centro de Custo
                  //----------------------------------------------------------------------
                  if sObrigaCC = 'S' then
                  begin
                     if not CafxContab.VerificaContaxCC(cdsParamCAFxContab.FieldByName('PLANO').AsInteger,
                                                        cdsParamCAFxContab.FieldByName('IDPESSOA').AsInteger,
                                                        cdsParamCAFxContab.FieldByName('PLACONTA').AsString,
                                                        cdsBem.FieldByName('CODCENTROCUSTO').AsString) then
                     begin
                        cdsDivergencias.Append;
                        cdsDivergencias.FieldByName('PLACA').AsFloat          := cdsBem.FieldByName('PLACA').AsFloat;
                        cdsDivergencias.FieldByName('DESBEM').AsString        := cdsBem.FieldByName('DESBEM').AsString;
                        cdsDivergencias.FieldByName('GRUPOCONTABIL').AsString := trim(cdsBem.FieldByName('DESCGRUPO').AsString) +
                                                                                 ' - Conta ' + trim(cdsParamCAFxContab.FieldByName('PLACONTA').AsString) +
                                                                                 ' - [' + trim(cdsParamCAFxContab.FieldByName('TIPOLANCAMENTO').AsString) + ']';
                        cdsDivergencias.FieldByName('CCUSTO').AsString        := 'Associe o Centro de Custo ' + trim(cdsBem.FieldByName('CODCENTROCUSTO').AsString) +
                                                                                 ' - ' + cdsBem.FieldByName('NOME').AsString + ' a Conta Contábil.';
                        cdsDivergencias.Post;
                     end;
                  end;
                  //----------------------------------------------------------------------
                  // Verifica se a conta contábil possui SubConta
                  //----------------------------------------------------------------------
                  iSubConta := cdsBem.FieldbyName('CODSUBCONTA').AsInteger;
                  if sObrigaSubConta = 'S' then
                  begin
                     if not CafxContab.ContaContab.TestaContaxSC(cdsParamCAFxContab.FieldByName('PLANO').AsInteger,
                                                                 cdsParamCAFxContab.FieldByName('IDPESSOA').AsInteger,
                                                                 iSubConta,
                                                                 cdsParamCAFxContab.FieldByName('PLACONTA').AsString) then
                     begin
                        if iSubConta <= 0 then
                        begin
                           cdsDivergencias.Append;
                           cdsDivergencias.FieldByName('PLACA').AsFloat          := cdsBem.FieldByName('PLACA').AsFloat;
                           cdsDivergencias.FieldByName('DESBEM').AsString        := cdsBem.FieldByName('DESBEM').AsString;
                           cdsDivergencias.FieldByName('GRUPOCONTABIL').AsString := trim(cdsBem.FieldByName('DESCGRUPO').AsString) +
                                                                                    ' - Conta ' + trim(cdsParamCAFxContab.FieldByName('PLACONTA').AsString) +
                                                                                    ' - [' + cdsParamCAFxContab.FieldByName('TIPOLANCAMENTO').AsString + ']';
                           cdsDivergencias.FieldByName('SUBCONTA').AsString      := 'A SubConta é obrigatória e não está cadastrada';
                           cdsDivergencias.Post;
                        end else
                        begin
                           cdsDivergencias.Append;
                           cdsDivergencias.FieldbyName('PLACA').AsFloat          := cdsBem.FieldbyName('PLACA').AsFloat;
                           cdsDivergencias.FieldbyName('DESBEM').AsString        := cdsBem.FieldbyName('DESBEM').AsString;
                           cdsDivergencias.FieldbyName('GRUPOCONTABIL').AsString := trim(cdsBem.FieldbyName('DESCGRUPO').AsString) +
                                                                                    ' - Conta ' + trim(cdsParamCAFxContab.FieldbyName('PLACONTA').AsString) +
                                                                                    ' - [' + cdsParamCAFxContab.FieldbyName('TIPOLANCAMENTO').AsString + ']';
                           cdsDivergencias.FieldbyName('SUBCONTA').AsString      := 'Associe a SubConta ' + cdsBem.FieldbyName('CODSUBCONTA').AsString + ' a Conta Contábil.';
                           cdsDivergencias.Post;
                        end;
                     end;
                  end;
               end else
               //-------------------------------------------------------------------------
               // Relata o erro gerado na contabilidade
               //-------------------------------------------------------------------------
               begin
                  cdsDivergencias.Append;
                  cdsDivergencias.FieldbyName('PLACA').AsFloat := cdsBem.FieldbyName('PLACA').AsFloat;
                  cdsDivergencias.FieldbyName('DESBEM').AsString := cdsBem.FieldbyName('DESBEM').AsString;
                  cdsDivergencias.FieldByName('GRUPOCONTABIL').AsString := 'Integração Contábil : ' + CafxContab.ContaContab.MessageInfo;
                  cdsDivergencias.Post;
               end;
               //-------------------------------------------------------------------------
               cdsParamCAFxContab.Next;
            end;
         end;
         cdsTipoMovimentacao.Next
      end;
      cdsBem.Next;
      if bCancela then break;
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmMTConsParamContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsBem.Close;
   cdsTipoMovimentacao.Close;
   cdsParamCAFxContab.Close;
   cdsDivergencias.Close;
   //-------------------------------------------------------------------------------------
   ParamCAF.Free;
   CafxContab.Free;
end;
//========================================================================================
procedure TfrmMTConsParamContab.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bCancela := True;
end;

end.

