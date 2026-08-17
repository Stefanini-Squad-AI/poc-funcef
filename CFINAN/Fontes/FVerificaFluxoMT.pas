unit FVerificaFluxoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, DBClient, uCMClientDataSet, uCtrlListTercFinanc, uCmSqlParams;
type
  TfrmVerificaFluxoMT = class(TfrmOkCancelar)
    pnlTitulo: TPanel;
    dbgdTipoRecDes: TwwDBGrid;
    dsTRDFaltantes: TDataSource;
    Panel2: TPanel;
    rgModoInclusao: TRadioGroup;
    rgTipo: TRadioGroup;
    CdsTRDFaltantes: TCMClientDataSet;
    rgFaltantes: TRadioGroup;
    rgOpRecPag: TRadioGroup;
    spTesteMontFluxo: TCMSqlParams;
    cdsTesteMontFluxo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgdTipoRecDesDblClick(Sender: TObject);
    procedure rgFaltantesClick(Sender: TObject);
    procedure rgOpRecPagClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CtrlListTerAux : TCtrlListTercFinanc;
    bTipoR : Boolean;
    bTipoP : Boolean;
    bTipoC : Boolean;
    bTipoD : Boolean;

    sNomeControle: String;
    
    procedure FiltraFaltantes;
    procedure HabDesabControles;
  public
    { Public declarations }
    sTipo         : String;
    iNumMarcados  : Integer;
  end;

var
  frmVerificaFluxoMT: TfrmVerificaFluxoMT;

implementation

{$R *.DFM}

uses uMensErro,uSistema, dBaseDados;

procedure TfrmVerificaFluxoMT.FormCreate(Sender: TObject);
begin
   //Inicializa CtrlListTerceiros
   CtrlListTerAux:=TCtrlListTercFinanc.Create;
   CtrlListTerAux.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega Tipos de Montagem de Fluxo
   cdsTesteMontFluxo.Close;
   spTesteMontFluxo.Open;

   bTipoR:=(cdsTesteMontFluxo.FieldByName('TIPOR').AsFloat<>0);
   bTipoP:=(cdsTesteMontFluxo.FieldByName('TIPOP').AsFloat<>0);
   bTipoC:=(cdsTesteMontFluxo.FieldByName('TIPOC').AsFloat<>0);
   bTipoD:=(cdsTesteMontFluxo.FieldByName('TIPOD').AsFloat<>0);

   rgModoInclusao.Enabled:=False;
   iNumMarcados:=0;
   sTipo:='';
end;

procedure TfrmVerificaFluxoMT.FormShow(Sender: TObject);
begin
   inherited;

   if (bTipoR or bTipoP or bTipoC or bTipoD) then
    begin
       HabDesabControles;

       case rgFaltantes.ItemIndex of
          0: begin
                //Carrega cds de TRD Faltantes
               CdsTRDFaltantes.Data:=CtrlListTerAux.ListTipoRDFaltantesFluxo( Sistema.IdEmpresa,True);
             end;
          1: begin
                //Carrega cdsTRDFaltantes com os Tipos de Documento de Rec./Des.
                CdsTRDFaltantes.Data:=CtrlListTerAux.ListTipDocFaltantesFluxo(Sistema.IdEmpresa);
             end;
       end;

       FiltraFaltantes;
    end
   else
    begin
       MsgDlg('Estrutura do Fluxo de caixa está incompleta.'+#10#13+
              'Proceder cadastramento da mesma no Cadastro de Montagem de Fluxo.',
              'Aviso',mtWarning,[mbOk],0);
       dbgdTipoRecDes.Enabled:=False;
       rgFaltantes.Enabled:=False;
       rgOpRecPag.Enabled:=False;
       rgTipo.Enabled:=False;
       rgModoInclusao.Enabled:=False;
       bbtnConfirmar.Enabled:=False;
    end;
end;

procedure TfrmVerificaFluxoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   CtrlListTerAux.Free;
end;

procedure TfrmVerificaFluxoMT.rgTipoClick(Sender: TObject);
begin
   FiltraFaltantes;
end;

procedure TfrmVerificaFluxoMT.dbgdTipoRecDesDblClick(Sender: TObject);
begin
   inherited;
   if (CdsTRDFaltantes.FieldByName('SELECIONADO').AsString='N') and
      (CdsTRDFaltantes.FieldByName('RECPAG').AsString<>sTipo) and
      (sTipo<>'') then
    begin
       MsgDlg('Não é permitido Selecionar Recebimentos e Desembolsos '+#10+#13+
              'ao mesmo tempo.','Erro',mtError,[mbOk],0);
       Abort;
    end;

    if (CdsTRDFaltantes.FieldByName('SELECIONADO').AsString='N') then
       Inc(iNumMarcados)
    else
       Dec(iNumMarcados);

    if sTipo='' then  sTipo:=CdsTRDFaltantes.FieldByName('RECPAG').AsString;
    if iNumMarcados=0 then sTipo:='';
    rgModoInclusao.Enabled:=(iNumMarcados<>0);
end;

procedure TfrmVerificaFluxoMT.rgFaltantesClick(Sender: TObject);
begin
   case rgFaltantes.ItemIndex of
      0: begin
            rgOpRecPag.Enabled:=(bTipoR and bTipoP);

            if not(rgOpRecPag.Enabled) then
               if bTipoR then
                  rgOpRecPag.ItemIndex:=0
               else
                  if bTipoP then rgOpRecPag.ItemIndex:=1;

            //Carrega cdsTRDFaltantes com os Tipos de Rec./Des.
            CdsTRDFaltantes.Filtered:=False;
            CdsTRDFaltantes.Filter:='';

            CdsTRDFaltantes.Close;
            CdsTRDFaltantes.Data:=CtrlListTerAux.ListTipoRDFaltantesFluxo(Sistema.IdEmpresa,True);
            FiltraFaltantes;

            rgTipo.Enabled:=True;
            rgTipo.ItemIndex:=0;
            rgTipoClick(nil);
         end;
      1: begin
            rgOpRecPag.Enabled:=(bTipoC and bTipoD);

            if not(rgOpRecPag.Enabled) then
               if bTipoC then
                  rgOpRecPag.ItemIndex:=0
               else
                  if bTipoD then rgOpRecPag.ItemIndex:=1;

            //Carrega cdsTRDFaltantes com os Tipos de Documento de Rec./Des.
            CdsTRDFaltantes.Filtered:=False;
            CdsTRDFaltantes.Filter:='';

            CdsTRDFaltantes.Close;
            CdsTRDFaltantes.Data:=CtrlListTerAux.ListTipDocFaltantesFluxo(Sistema.IdEmpresa);
            FiltraFaltantes;
            
            rgTipo.Enabled:=False;
         end;
   end;
   iNumMarcados:=0;
   sTipo:='';
end;

procedure TfrmVerificaFluxoMT.rgOpRecPagClick(Sender: TObject);
begin
   case rgOpRecPag.ItemIndex of
      0: begin
            rgFaltantes.Enabled:=(bTipoR and bTipoC);

            if not(rgFaltantes.Enabled) then
               if bTipoR then
                  rgFaltantes.ItemIndex:=0
               else
                  if bTipoC then rgFaltantes.ItemIndex:=1;

         end;
      1: begin
            rgFaltantes.Enabled:=(bTipoP and bTipoD);

            if not(rgFaltantes.Enabled) then
               if bTipoP then
                  rgFaltantes.ItemIndex:=0
               else
                  if bTipoD then rgFaltantes.ItemIndex:=1;
         end;
   end;

   case rgFaltantes.ItemIndex of
      0: begin
            //Carrega cdsTRDFaltantes com os Tipos de Rec./Des.
            CdsTRDFaltantes.Filtered:=False;
            CdsTRDFaltantes.Filter:='';

            CdsTRDFaltantes.Close;
            CdsTRDFaltantes.Data:=CtrlListTerAux.ListTipoRDFaltantesFluxo(Sistema.IdEmpresa,True);
         end;
      1: begin
            //Carrega cdsTRDFaltantes com os Tipos de Documento de Rec./Des.
            CdsTRDFaltantes.Filtered:=False;
            CdsTRDFaltantes.Filter:='';

            CdsTRDFaltantes.Close;
            CdsTRDFaltantes.Data:=CtrlListTerAux.ListTipDocFaltantesFluxo(Sistema.IdEmpresa);
         end;
   end;

   FiltraFaltantes;
end;

procedure TfrmVerificaFluxoMT.HabDesabControles;
begin
   rgFaltantes.Enabled:=False;
   rgOpRecPag.Enabled:=False;

   if bTipoR or bTipoP then
    begin
       if bTipoC or bTipoD then rgFaltantes.Enabled:=True;
       
       rgFaltantes.ItemIndex:=0;

       if bTipoR then
          rgOpRecPag.ItemIndex:=0
       else
          rgOpRecPag.ItemIndex:=1;

       rgOpRecPag.Enabled:=(bTipoR and bTipoP);
    end
   else
    begin
       rgFaltantes.ItemIndex:=1;

       if bTipoC then
          rgOpRecPag.ItemIndex:=0
       else
          rgOpRecPag.ItemIndex:=1;

       rgOpRecPag.Enabled:=(bTipoC and bTipoD);
    end;
end;

procedure TfrmVerificaFluxoMT.FiltraFaltantes;
var
   sFiltro : String;
begin
   CdsTRDFaltantes.Filtered:=False;
   CdsTRDFaltantes.Filter:='';

   sFiltro:='RECPAG=''R''';
   if (rgOpRecPag.ItemIndex=1) then sFiltro:='RECPAG=''P''';

   if (rgFaltantes.ItemIndex=0) then
    if (rgTipo.ItemIndex=0) then
       sFiltro:=sFiltro+' AND ANASINT = ''A'''
    else
       sFiltro:=sFiltro+' AND ANASINT = ''S''';

   CdsTRDFaltantes.Filter:=sFiltro;
   CdsTRDFaltantes.Filtered:=True;

   case rgFaltantes.ItemIndex of
      0: case rgOpRecPag.ItemIndex of
            0: pnlTitulo.Caption:='Tipos de Recebimento que ainda não '+
                                  'fazem parte do Fluxo ';
            1: pnlTitulo.Caption:='Tipos de Desembolso que ainda não '+
                                  'fazem parte do Fluxo ';
         end;
      1: case rgOpRecPag.ItemIndex of
            0: pnlTitulo.Caption:='Tipos de Documento de Recebimento que ainda não '+
                                  'fazem parte do Fluxo ';
            1: pnlTitulo.Caption:='Tipos de Documento de Pagamento que ainda não '+
                                  'fazem parte do Fluxo ';
         end;
   end;
end;

end.
