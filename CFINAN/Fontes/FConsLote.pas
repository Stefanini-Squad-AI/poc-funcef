unit FConsLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, MontaSelect, DBCtrls;

type
  TfrmConsLote = class(TfrmSairAjuda)
    dbgrDocLote: TwwDBGrid;
    lbldoc: TLabel;
    qryLote: TwwQuery;
    qryDocLote: TwwQuery;
    dsDocLote: TwwDataSource;
    qryDocLoteSALDO: TFloatField;
    qryDocLoteIDFORCLI: TFloatField;
    qryDocLoteOPERACAO: TStringField;
    qryDocLoteCODDOCUMENTO: TFloatField;
    qryDocLoteIDPESSOA: TFloatField;
    qryDocLoteNODOCUMENTO: TFloatField;
    qryDocLoteCOMPLDOCUMENTO: TStringField;
    qryDocLoteDATAPROGRAMADA: TDateTimeField;
    qryDocLoteDATAVENCTO: TDateTimeField;
    qryDocLoteRECPAG: TStringField;
    qryDocLoteNOME: TStringField;
    qryDocLoteSTATUS: TStringField;
    qryDocLoteNUMLEITCODBARRAS: TStringField;
    qryDocLoteNUMDIGCODBARRAS: TStringField;
    qryDocLoteTIPODOC: TStringField;
    msLote: TMontaSelect;
    bbtnSelecionaDoc: TBitBtn;
    qryLoteNUMLOTE: TFloatField;
    qryLoteCODPORTFORMA: TFloatField;
    qryLoteDATAEMISSAO: TDateTimeField;
    qryLoteNUMCHQBORDERO: TStringField;
    qryLoteFAVORECIDO: TStringField;
    qryLoteOBSERVACAO: TStringField;
    qryLoteDESCRICAO: TStringField;
    qryLoteIDPROCESSO: TFloatField;
    dblPortadorForma: TDBText;
    dsLote: TwwDataSource;
    lblPortadorForma: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    DBText5: TDBText;
    Label6: TLabel;
    DBText6: TDBText;
    Label7: TLabel;
    DBText7: TDBText;
    Label8: TLabel;
    DBText8: TDBText;
    Label9: TLabel;
    DBText9: TDBText;
    Label10: TLabel;
    DBText10: TDBText;
    Label11: TLabel;
    DBText11: TDBText;
    qryLoteFLAGEMISSAO: TStringField;
    qryDocLoteVALOR: TFloatField;
    qryLoteFLAGCANCEL: TStringField;
    qryDocLoteHISTORICOCOMPL: TStringField;
    procedure bbtnSelecionaDocClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsLote: TfrmConsLote;

implementation

Uses uSistema, urad, uDataBase,uintegraback, DBaseDados;
{$R *.DFM}

procedure TfrmConsLote.bbtnSelecionaDocClick(Sender: TObject);
begin
  inherited;
  msLote.Executar;
  if msLote.RetornouValor then begin
     //
     qryLote.Close;
     qryLote.ParamByName('pNUMLOTE').AsInteger := StrToInt(msLote.ValoresChave[0]);
     qryLote.Open;
     //
     qryDocLote.Close;
     qryDocLote.ParamByName('pNUMLOTE').AsInteger := StrToInt(msLote.ValoresChave[0]);
     qryDocLote.Open;
  end;
end;

procedure TfrmConsLote.FormCreate(Sender: TObject);
Var
  iNumLote :LongInt;
begin
  inherited;

  bbtnSelecionaDoc.Enabled := True;
    
  If (Sistema.idrad <> 0) Then
  Begin
     If FazQuery(DtmBaseDados.Qry,'SELECT NUMLOTE FROM LOTEPAGTO WHERE IDPROCESSO = ' + IntToStr(Sistema.idrad)) Then
     Begin
        iNumLote                 := DtmBaseDados.Qry.FieldByName('NUMLOTE').AsInteger;
        bbtnSelecionaDoc.Enabled := False;
     End
     Else
        iNumLote := -1;

     If DtmBaseDados.Qry.Active Then DtmBaseDados.Qry.Close;
  End
  Else
    iNumLote := -1;

  msLote.Filtro.Add('LOTEPAGTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  msLote.Tabelas.add(

            '(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
          '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
          '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum '+

          ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where '+
          '        D.RECPAG         = '''+ IntegraBack.RecPag +'''  AND '+
          '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and '+
          '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and b.idusuario=' +
                         inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
                         IntegraBack.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                         inttostr(sistema.idusuario)+')) group by numlote  ) totlote ');
  msLote.Filtro.Add(
          '  totlote.totdocum=totdocum.totdocum and '+
          ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lotepagto.NUMLOTE  ');


  //
  qryLote.Close;
  qryLote.ParamByName('pNUMLOTE').AsInteger := iNumLote;
  qryLote.Open;
  //
  qryDocLote.Close;
  qryDocLote.ParamByName('pNUMLOTE').AsInteger := iNumLote;
  qryDocLote.Open;
end;

end.
